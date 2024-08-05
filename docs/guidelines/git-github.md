# Git and Github

This guideline contains some basic information on configuration of Git and user profiles on github.com. Our perspective would be security and privacy. The guideline is by no means exhaustive, it's more an introduction to basic config and the correlation between Git and github.com

!!! tip "Git vs Github.com"

    Git is a distributed version control system for tracking changes in source code, while GitHub is a platform that hosts Git repositories online. GitHub builds upon Git, offering a centralized place for developers to share and work on code together.


!!! Info "The SCM Policy"

    [The Equinor Developer Portal](https://developer.equinor.com/) contains our [Source Code Management System Policy](https://developer.equinor.com/governance/scm-policy/). Please make sure you are familiar with the content.

## TLDR;

- Configure your local Git with proper name and email. Use your full name with the profile. Use privacy options for hiding your github.com primary email.
- For authentication and communication with github.com, use Git with SSH and passphrase protected private keys.
- Use separate SSH keys for different client devices.
- Book a yearly reccurring event with yourself to rotate SSH keys.

## Git

For this guideline we use Git from the command line. Be aware, there are many tools that hide the internal mechanics of Git within the tool. For these tools most settings are defined within the tool itself.

We assume that `git` and `ssh` are installed on your system. We do not cover the installation process besides mentioning the fact that git and ssh like any other piece of software must be kept up-to-date.

The official [Git documentation](https://git-scm.com/doc) is a good source for authoritative answers and deep dives.


### How Git manages config

Git is dependent on proper configuration to work. Configuration can be read from the command line (using the `-c` option), environment variables or files. The [official guide](https://git-scm.com/docs/git-config#_configuration) provides the details. 

We usually store Git config in files. Git will read config from multiple locations depending on their availability. The files are read in the order shown below, the `last value read` will take precedence over values read earlier.

1. System config (usually `/etc/gitconfig`)
2. Config file in home directory (usually `$HOME/.gitconfig`)
3. Repository config files (`$GITDIR/config`)
  
The config files can be updated manually with a text editor or by using Git

Git configuration from the command line follow the following structure:

```shell
git config options section.key value
```

For the examples below no "scope" is provided so Git will expect that you are in a Git directory and then work with a repo config file. A error message will be given if this is not the case. Use the parameter `--system`, `--global` or `--local` to specify scope.

Example; setting the user name:

```shell
git config user.name "Peter Pan"
```

Reading the config looks like this:

```shell
git config --get user.name
Peter Pan
```

Removing config looks like this:

```shell
git config --unset user.name
```

Setting your user name for a global scope would look like this:

```shell
git config --global user.name "Peter Pan"
```

!!! tip Showing location of all git config

    Using the command `git config --list --show-origin` will expand all git config across the different levels.


### Recommended generic basic config

This section contains the recommended basic generic configuration for Git.


```shell
git config --global user.name "value"
git config --global user.email "value"
```

- The value for username should be your full name ([SCM Policy](https://developer.equinor.com/governance/scm-policy/))
- The value for user email should be the "[Not visible in emails](https://github.com/settings/emails)" value from your github.com account. The format will usually be `ID+USERNAME@users.noreply.github.com` (Privacy, [Official Github documentation](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address))

!!! tip "Additional email privacy"

    We also recommend that you check the "Keep my email address private" and even "Block command line pushes that expose my email" in [email section](https://github.com/settings/emails) of your profile on github.com


### Using SSH with git

Git uses HTTP or SSH to communicate with github.com. Both alternatives are viable and provide a good level of security. HTTP(S) assumes the usage of PAT (Personal Access Token) tokens rather than account passwords. A short threat model of the options contains the following sections:


| Threat                | SSH (with password-protected keys)                       | HTTPS (with PATs)                                              |
|-----------------------|---------------------------------------------------------|----------------------------------------------------------------|
| **Interception**      | Encrypted; MITM attack needed. Passphrases protect keys on disk, but not in transit since keys aren't transmitted. | Encrypted; susceptible to MITM, but TLS and certificate validation mitigate risks. PATs are used instead of passwords.  |
| **Impersonation**     | Theft of private key and passphrase required for impersonation. | Relies on secure storage of PATs. Impersonation possible if a PAT is exposed. |
| **Eavesdropping**     | Encrypted traffic; passphrase adds security at rest, not in transit. | Encrypted traffic; PATs should be securely stored to prevent unauthorized access. |
| **Authentication**    | Strong, with added layer of passphrase protection for key files. | PATs can be set to expire, enhancing security by limiting the lifespan of access credentials. |
| **Configuration**     | Requires management of key pairs and passphrases, slightly more complex. | Requires management of PATs, including regular rotation and setting appropriate expiration dates. |
| **Availability**      | Direct; less prone to web attacks, but firewalls might block SSH. | High through standard web ports; PATs can be revoked or expire, requiring renewal for continued access. |
| **Key/Token Expiry**  | SSH keys do not expire by default; requires manual rotation for security. | PATs can be configured to expire, forcing regular renewal and review of access permissions. |
| **Theft of Credentials** | Risk mitigated by passphrase encryption of the private key. Physical access or malware required to steal. | Risk of PAT exposure, especially if stored insecurely or transmitted over insecure channels. |
| **Least privilege** | SSH keys inherit all permissions of a user. No granularity | PAT tokens can be configured for fine grained permissions and then provide access to all or only specific repos. This could strengthen security. Token management will add extra complexity. |


!!! tip "Use SSH with Git"

    We recommend using SSH when Git authenticates and communicates with github.com. Private keys should be passphrase protected

### Configuring Git to use SSH

The [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) in the official Github documentation is a good source for detailed information.

The following sections of the guideline contains the usual steps to get started with SSH.

#### [Generate a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)
  - Type of key should be `ed25519`
  - Specify a filename (`-f`). We assume you can have multiple keys and suggest a naming convention like "service"-"identity"-"index". The index could be creation date and then used for automating key rotation.
  - Add a comment (`-C`) to help identify the key's purpose. This will be added to the public key as generic text but will not have any functional impact. It will not be exposed on github.com. However, the purpose of a public key is to "share it", so use with caution (PII).

Example; Creating a SSH key for the Github user `larskaare`

```shell
ssh-keygen -t ed25519 -f ~/.ssh/github_larskaare_1 -C "Github SSH auth key for machine 1"
```

You will be asked "Enter passphrase (empty for no passphrase)", we strongly recommend using a passphrase!. Two files are created, one named `github_larskaare_1` and one named `github_larskaare_1.pub`. The file with the `.pub` extension contains the public part of the key. The file `github_larskaare_1` contains the private part of the key which should be protected and never shared.

!!! Tip "Re-using keys?"

    We advice on creating separate SSH keys for separate machines and devices and not to re-use the same key on them all. This is good security practice in case of compromise - don't have one key to the whole kingdom. A more fine grained approach will also be good when keys are to be revoked or updated. You could also consider using different keys for professional versus personal usage.

!!! Tip "Passphrases"

    Store passphrases in a password manager.

#### Configure SSH and adding the key to the key-agent

Adding the generated SSH key to the `ssh-agent` gives you a secure repository for your private keys's passphrases. Adding keys and passphrases to the key agent eliminates the need to repeatedly enter the passphrase.

Follow the [official documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent) of and add the SSH key to the ssh-agent. Be aware of the operating system selector at the top of the page - it will give you instructions for **Mac**, **Windows** and **Linux**. The sections below covers a minimal set-up of how to add the SSH key to the agent. The official version has more details - you can follow either. 

#### Adding SSH config

SSH uses a config file for it's configuration (this file is not used by Git). The user-specific file is usually stored in `~/.ssh/config` and should be updated prior to using the SSH key and the ssh-key agent. Consult the documentation of your SSH client for details. (Many use OpenSSH which have good manual pages - [OpenSSH Manual Pages](https://www.openssh.com/manual.html))

A SSH config file with minimum set-up usually looks like this:

```
Host github.com
    AddKeysToAgent yes
    IdentitiesOnly=yes
    IdentityFile ~/.ssh/github_larskaare_1
```

#### Adding the private SSH key to the SSH agent

We assume that the `ssh-agent` is available and running.

The following command will add the private part of the SSH key we generated to the ssh-agent

```shell
ssh-add ~/.ssh/github_larskaare_1
```

For MacOS we would typically add the passphrase to the keychain as well

```shell
ssh-add --apple-use-keychain ~/.ssh/github_larskaare_1
```

### Configure github.com to use our SSH key

We now have a SSH key that we can use when communicating with github.com. To be able to use this key with Github we need to upload the public part of the key to github.com

- Print the public key

```shell
cat ~/.ssh/github_larskaare_1.pub
```

- Copy the public key (algorithm and key) and add it as a new SSH Authentication key to your Github profile at [https://github.com/settings/keys](https://github.com/settings/keys)

- Verify that Github accepts the key, test the connection

(When testing the connection to github.com, ssh will ask if the fingerprint of the SSH key presented by github.com is ok and if you would like to continue. If you are connecting to github.com answer "yes". Understanding this trust chain is not for this guide - but if you want to validate the fingerprint that's suggested you can correlate it to the [official ssh key fingerprints](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints). The known hosts file that is mentioned is the `~/.ssh/known_hosts` file)

```shell
ssh -T git@github.com
```

The command should a message similar to this to indicate success:

```
Hi larskaare! You've successfully authenticated, but GitHub does not provide shell access.
```

### Using Git and SSH with github

A this stage we have SSH all configured on both ends. However, how do we tell git to use SSH? You typically would do this when cloning a repo or configuring the `remote`

- A git clone command like this `git clone git@github.com:equinor/appsec.git` tells git to use SSH. The same command for using HTTPS would be git `git clone https://github.com/equinor/appsec.git`. The giveaway for HTTPS would be the url which starts with https 😅 That is not included when we use SSH - we rather have the `git@github.com` part of the url.
- You can examine the remote of a repo to identify if it uses SSH or HTTPS

```shell
git remote -v
```

should out output remote name and a URI containing the `git@github.com`

```
origin	git@github.com:equinor/appsec.git (fetch)
origin	git@github.com:equinor/appsec.git (push)
```

- You can add and change remotes for a cloned repo, from HTTPS to SSH using the command `git remote set-url <remote name> <new uri>`

### Configure the SSH key for usage with Equinor's SSO protected resources

The Equinor organization on github.com is protected behind SSO login. In order for your SSH key to be used with resources in the Github "Equinor" or "Equinor-Playground" organizations you need to authorize the key for these permissions on your behalf. [Github documentation](https://docs.github.com/en/enterprise-cloud@latest/authentication/authenticating-with-saml-single-sign-on/authorizing-an-ssh-key-for-use-with-saml-single-sign-on) gives you all the details.

- To authorize your key head over to your [SSH Key Settings](https://github.com/settings/keys) on your profile on Github, select the key in question, select "Configure SSO" and authorize against organisation(s).

### Rotating SSH keys

!!! Tip "Rotate your SSH keys"

    Your SSH keys, and passphrases, should be rotated at least on a yearly basis. Put an re-occurring appointment in your calender for this. This process could be automated, but doing it once in a while in manual mode may help you not to forget how things work.

## Github.com

### Basic config for your account

You will find your Github settings at [https://github.com/settings/profile](https://github.com/settings/profile).

We recommend the following settings:

#### [Public profile](https://github.com/settings/profile)

-   Use your full name
-   Select an recognizable avatar/picture for profile picture


#### [Emails](https://github.com/settings/emails)

- Have a primary and a secondary email address registered
- Select "Keep my email addresses private"
- Select "Block command line pushed that expose my email"

#### [Password and authentication](https://github.com/settings/security)

- Enable Two-Factor authentication
    - This is **not** the Two-Factor for your Equinor account, this is for your account at github.com
- Enable multiple Two-Factor methods
    - Authenticator App
    - SMS/Text
- Preferred 2FA method should be Authenticator app
- (Experiment with PassKeys or Security Keys)
- Extract "Recovery codes" and store in your password manager

#### [Codespaces](https://github.com/settings/codespaces)

- Validate the "Editor preference"
    - "Visual Studio Code for the Web" is a good option for many
- Validate "Default retention period"
    - 14 days may be a good period (Codespaces incurs storage charges)
- Region
    - Set manually to "Europe West"
- For signing commits from a codespace, see our guideline on [Signed Commits](./git-signed-commits.md)

#### [Code security an analysis](https://github.com/settings/security_analysis)

- "Push protection for yourself" should be enabled
     - Block push with supported secrets against public repos

#### [Applications](https://github.com/settings/installations)

- On a regular basis (at least once a year) - review apps that you have authorised to act on your behalf
- Github Apps
    - Limit access to specific repos
    - Uninstall apps that not are in use
- Authorized OAuth Apps
    - Review permissions
    - Review organization access
    - Revoke access if not in use
  
#### [Security log](https://github.com/settings/security-log)

- Familiarize with the content of the security log

#### [Developer settings](https://github.com/settings/developers)

- Review Personal access tokens (PAT)
    - Review scope
    - Review organizational access
    - Review repository access (fine grained)
    - Review permissions (fine grained)
    - Rotate token (maximum token life time should be 12 months)
    - Delete if not in use

Fine-grained tokens are in beta (March 2024). Don't use beta features for anything production.

## What's next

If you have reached this far - the next natural steps would be to continue the journey with [getting your git commits signed](git-signed-commits.md)

## External resources

- [Git downloads](https://git-scm.com/downloads)
- The [Github Cli](https://docs.github.com/en/github-cli) can be used as a [credential helper](https://cli.github.com/manual/gh_auth_setup-git) for git.
