# Git and Github

This guideline contains some basic information on configuration of git and user profiles on github.com. Our perspective would be security and privacy. The guideline is by no means exhaustive, it's more an introduction to basic config and the correlation between git and github.com

!!! tip "Git vs Github.com"
    Git is a distributed version control system for tracking changes in source code, while GitHub is a platform that hosts Git repositories online, facilitating collaboration and project management. GitHub builds upon Git, offering a centralized place for developers to share and work on code together.

[The Equinor Developer Portal](https://developer.equinor.com/) contain our [Source Code Management System Policy](https://developer.equinor.com/governance/scm-policy/). Please make sure you are familiar with the content of this policy.

## TLDR;

- Configure your local git with proper name and email. Use your full name with the profile. Use privacy options for hiding your github.com primary email.
- For authentication and communication with github.com, use git with SSH and password protected private keys.
- Use separate SSH keys for different client devices.
- Book a yearly re-occurring event with yourself to rotate SSH keys and passphrases.

## Git

For this guideline our reference is using git from the command line. There are many tools in use which utilises git and hide the internal mechanics of git configuration within the tool.

We assume that git and ssh is installed on your system. We do not cover the installation process besides mentioning the fact now that git and ssh like any other piece of software, should be kept up-to-date.

The official [git documentation](https://git-scm.com/doc) is a good source for authoriative answers and deep dives.


### How git manages config

Git is dependent on proper configuration to work. Configuration can be read from the command line (using the `-c` option), environment variables or files. The [official guide]([authoriative](https://git-scm.com/docs/git-config#_configuration)) provides the details. 

We usually store git config in files. Git will read config from multiple files depending on their availability. The files are read in the order shown below, the `last value read` will take precedence over values read earlier.

1. System config (usually `/etc/gitconfig`)
2. Config file in home directory (usually `$HOME/.gitconfig`)
3. Repository config files (`$GITDIR/config`)
  
The config files can be updated manually or by using git

```shell
git config <section>.<key> <value>
```

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

For the examples above no "scope" is provided so git will work with repo config file. Use the parameter `--system`, `--global` or `--local` to specify scope.

Setting your user name for a global scope would look like this:

```shell
git config --global user.name "Peter Pan"
```


### Recommended generic basic config

!!! tip "Recommended generic config"

    This section contains the recommended basic generic config for git.


```shell
git config --global user.name "value"
git config --global user.email "value"
```

- The value for username should be your full name ([SCM Policy](https://developer.equinor.com/governance/scm-policy/))
- The value for user email should be the "[Not visible in emails](https://github.com/settings/emails)" value from your github.com account. The format will usually be `ID+USERNAME@users.noreply.github.com` (Privacy, [Official Github documentation](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address))

!!! tip "Additional email privacy"

    We also recommend that you set the "Keep my email address private" and even "Block command line pushes that expose my email" in [email section](https://github.com/settings/emails) of your profile on github.com


### Using SSH with git

Git uses HTTP or SSH to communicate with github.com. Both alternatives are viable and provide a good level of security. HTTP(S) assumes the usage of PAT (Personal Access Token) tokens rather than account passwords. A short threat model of the options could like this:


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
| **Least privilege** | SSH keys can inherit all permissions of a user. No granularity | PAT tokens can be configured for fine grained permissions and then provide access to all or only specific repos. This could strengthen security. Token management will add extra complexity. |


!!! tip "Use SSH with git"

    We recommend using SSH with git authenticates and communicates with github.com. Private keys should be password protected (or stored in a strong key service/device, like Keychain on MacOS or Yubikey's)


### Configuring git to use SSH

The [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) in the official Github doc is a good source for information.

These would be the usual steps:

#### [Generate a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)
  - Type of key should be `ed25519`
  - Specify a filename (`-f`). We assume you can have multiple keys and suggest a naming convention like "service"-"identity"-"index". The index could be creation date and then used for automating key rotation.
  - Add a comment (`-C`) to help identify the key's purpose. This will be added to the public key as generic text and have no functional impact. It will not be exposed on github.com. However, the purpose of a public key is to "share it", so use with caution (PII).

Example; Creating a ssh key for the github handle `larskaare`

```shell
ssh-keygen -t ed25519 -f ~/.ssh/github_larskaare_1 -C "Github ssh for machine 1"
```

Two files are created, one named `github_larskaare_1` and one named `github_larskaare_1.pub`. The file with the `.pub` extension contains the public part of the key.

!!! Tip "Re-using keys?"

    We advice on creating separate ssh keys for separate machine and devices and not to re-use one key on them all.

!!! Tip "Passphrases"

    Store passphrases in a password manager.

!!! Tip "Use a password manager to generate and serve SSK keys"

    Using a decent password manager to generate, serve and protect the SSH keys could be a very good option. The private key will not be stored on disk and biometrics could be used to access keys.

#### Configure SSH and adding the key to the key-agent

Adding the generated SSH key to the `ssh-agent` gives you a secure repository for your private keys's passphrases. Adding keys and passphrases to the key agent eliminates the need to repeatedly enter the passphrase.

Follow the [official documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent) of adding the SSH key to the ssh-agent. Be aware of the operating system selector at the top of the page - it will give you instructions for **Mac**, **Windows** and **Linux**.


#### Adding SSH config

SSH uses a config files for it's configuration (these are not the same files that git use). The user-specific file is usually stored in `~/.ssh/config` and should updated prior to using the SSH key and the ssh-key agent. Depending on you version of SSH, documentation is often available using the command `man ssh_config`. The [OpenSSH Manual Pages](https://www.openssh.com/manual.html) could also be a good resource.

A typical set-up for MacOS for the key we generated in the example would look like this:

```
Host github.com
    AddKeysToAgent yes
    IdentitiesOnly=yes
    UseKeychain yes
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

- List public key
```shell
   cat ~/.ssh/github_larskaare_1.pub
```

- Copy the public key and add it as a new SSH Authentication key to your Github profile at [https://github.com/settings/keys](https://github.com/settings/keys)

- Verify that Github accepts the key, test the connection

```shell
ssh -T git@github.com
```

The command should a message similar to this to indicate success:

```
Hi larskaare! You've successfully authenticated, but GitHub does not provide shell access.
```

### Using git with SSH with github

A this stage we have SSH all configured on both ends, how do we tell git to use SSH? You typically would do this when cloning a repo or configuring the `remote`

- A git clone command like this `git clone git@github.com:equinor/appsec.git` tells git to use SSH. The same command for using HTTPS would be git `git clone https://github.com/equinor/appsec.git`. The giveaway for SSH would be the username part `git@github.com` of the url.
- You can examine the remote of a repo to identify if it uses SSH or HTTPS

```shell
git remote -v
```

should out output remote name and a URI containing the `git@github.com`

```
origin	git@github.com:equinor/appsec.git (fetch)
origin	git@github.com:equinor/appsec.git (push)
```

- You can add and change remotes for a cloned repo, from HTTPS to SSH using the command `gir remote set-url <remote name> <new uri>`

### Configure the SSH key for usage with Equinor's SSO protected resources

The Equinor organization on github.com is protected behind SSO login. In order for your SSH key to be used with resources in the Github Equinor or Equinor-Playground organizations you need to authorize the key for these permissions on your behalf. [Github documentation](https://docs.github.com/en/enterprise-cloud@latest/authentication/authenticating-with-saml-single-sign-on/authorizing-an-ssh-key-for-use-with-saml-single-sign-on) gives you all the details.

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
  - This is **not** the Two-Factor for your Equinor account, this is MFA for your account at Github.com
- Enable multiple Two-Factor methods
  - Authenticator App
  - SMS/Text
- Preferred 2FA method should be Authenticator app
- (Experiment with PassKeys or Security Keys)
- Extract "Recovery codes" and store in your password manager

#### [Codespaces](https://github.com/settings/codespaces)

- Enable GPG verification
- Validate the "Editor preference"
  - "Visual Studio Code for the Web" is a good option for many
- Validate "Default retention period"
  - 14 days may be a good period (Codespaces incurs storage charges)
- Region
  - Set manually to "Europe West"

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
  - Rotate token (maximum token life time should be 6 months)
  - Delete if not in use

Fine-grained tokens are in beta (March 2024). Don't use beta features for anything production.