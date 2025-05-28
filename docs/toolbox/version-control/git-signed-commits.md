# Signed commits

The code from our software configuration management system (SCM) is the starting point for a lot of secure coding practices. Signed Git commits are an essential security practice which provides a layer of verification that helps mitigate several threats. Some of these threats are:

- **Impersonation**: Signed commits use keys to sign the work. By doing so, they certify that the commit was made by the claimed individual. This helps prevent an attacker from impersonating a developer and submitting malicious code.

- **Code tampering**: Signing commits ensures the integrity of the code from the time it was committed. If the code is altered in any way after it was signed, the signature will no longer be valid. This helps protect against unauthorized code modifications, which could introduce vulnerabilities or malicious code.

- **Replay attacks**: Signed commits can help mitigate replay attacks where an attacker attempts to re-submit a legitimate commit to a different context, potentially causing unintended consequences. The signature verifies not just the content of the commit but also its context within the repository history.

- **Long-term repository integrity**: By using signed commits, organizations can ensure the long-term integrity of their codebase. This is crucial for auditing and tracking the provenance of code changes, making it easier to trace back and verify the authenticity of commits over time.

- **Increased trust and compliance**: For projects that require strict compliance and governance standards, signed commits provide a mechanism to enforce such policies. They increase trust among contributors and users by ensuring that all changes are authenticated and authorized by the rightful committers.

## TLDR;

- Sign all your Git commits
- Use SSH, with a passphrase protected private key, to sign your Git commits
- Use separate SSH keys for signing and authentication
- Use branch protection and required signed Git commits
- GitHub Codespaces sign commits for you, but be aware of a few [caveats](#signing-on-github-codespaces)

## Signing methods

The official [GitHub documentation](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification) on signature verification shows that commits can be signed using GPG, SSH or S/MIME. The 3 different methods have their pros and cons.

| Feature/Aspect             | SSH Signing                                                | GPG Signing                                                    | S/MIME Signing                                               |
|----------------------------|------------------------------------------------------------|----------------------------------------------------------------|--------------------------------------------------------------|
| **Basic Mechanism**        | Uses SSH keys for both authentication and signing. | Utilizes a public-private key pair specifically for signing.   | Uses certificates issued by a Certificate Authority (CA).    |
| **Identity Verification**  | SSH public keys are used to verify the signature.           | Verification is based on a web of trust or direct key sharing. | Relies on certificates verified and issued by trusted CAs.   |
| **Infrastructure**         | Requires SSH key setup; already needed for repository access. | Requires GPG software and management of key pairs.             | Requires obtaining and managing a certificate from a CA. Potential complex PKI     |
| **Ease of Setup**          | Simple for users already using SSH keys for Git operations.  | Can be complex due to key generation, management, and sharing. | Varies; obtaining a certificate can be straightforward or complex depending on the provider. |
| **Cross-platform Support** | Broad support across various platforms and Git tools.        | Well-supported, with widespread integration in Git tools.      | Support varies; some tools may not support S/MIME directly.   |
| **Pros**                   | - Simplifies workflow by using the same keys for authentication and signing†. <br> - Integrated into SSH, which is commonly used for secure Git operations. | - Decentralized and flexible, with a variety of algorithms and key sizes. <br> - Well-established in the open-source community. | - Trust model is straightforward, based on established CAs. <br> - May align with existing certificate-based security practices (e.g., email). |
| **Cons**                   | - Primarily verifies the commit was pushed by an authenticated user, not necessarily the commit's author. <br> - SSH key management is crucial; compromised keys pose a risk. | - Key management and the web of trust model can be complex. <br> - Requires active key maintenance (revocation, expiration). | - Dependent on third-party CAs for issuance and trust. <br> - Certificates have expiration dates and may incur costs. |

† *while reusing the SSH key is a recognized advantage of SSH signing, we recommend against this practice, see below.*

!!! Note Signing method

    We recommend using self-signed SSH keys for signing your git commits (In the future we may switch to a certificate based approach)

## Configure your local development environment

For this guideline our reference is using Git from the command line. 

We assume that Git and SSH is installed on your system. 

We assume that you are using SSH to authenticate Git with github.com. Consult our [guideline](git-github.md) for more information on this topic.

The GitHub documentation on [SSH commit signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification#ssh-commit-signature-verification) is a good source for detailed information.

### Adding a SSH key for signing

!!! Note Use multiple SSH keys

    We recommend using different SSH keys for authentication and signing. This may add some extra complexity and it may provide a more robust set-up with looser coupling of key components of the SDLC.

To create a new SSH key for signing you can use the following command (alter the date manually):

```shell
ssh-keygen -t ed25519 -f ~/.ssh/git_ssh_signing_key_1 -C "Created on <date>, for larskaare on github.com"
```

This will create a SSH signing key and add a comment on date and purpose. Add a passphrase to the key. Success full key generation will output the key fingerprint and a randomart image (randomart is supposed to be a visualisation making it easier to validate keys - and identify changes)(You can also find more info on SSH keys on our [git guideline](git-github.md#generate-a-new-ssh-key))

Add the new key to the ssh-agent

```shell
ssh-add ~/.ssh/git_ssh_signing_key_1
```

### Configure git to use the SSH key

We will configure the git global settings to use the new SSH key for signing commits locally. Examples assume you created the key as defined above.

```shell
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/git_ssh_signing_key_1.pub
git config --global commit.gpgsign true
```

These lines will tell git to use SSH for signing commit, tell git where to find the key that should be used and then tell git to always sign commits. If you do not add this last line you will specifically have to add the `-S` parameter for each commit you can to sign.

More information on this step can be found in the [GitHub documentation](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key#telling-git-about-your-ssh-key)


### Examining the git log

To verify that commits are signed locally you can use the following command:

```shell
git log --show-signature
```

When you run this command on a newly configured system you may get an error message like `error: gpg.ssh.allowedSignersFile needs to be configured and exist for ssh signature verification`. *This error will easily be overlooked in the wall of text from the log*. In order for git to verify signatures locally you need to add the public keys that are used to sign to a file that Git will use.

We will create the allowed_signers file. It typically has the format like "signer email" "key-type" "key-body". The key in question is the public key of the SSH key we use to sign our commits.

```shell
git config --global gpg.ssh.allowedSignersFile ~/.ssh/allowed_signers
echo $(git config --get user.email) \
     $(cat ~/.ssh/git_ssh_signing_key_1.pub) \
     | awk '{print $1,$2,$3}' >> ~/.ssh/allowed_signers
```

- The first line tells Git which file we are going to use for allowed_signers
- The second line emits the information on our key and adds it to the allowed_signers file. The file is created if it does not exist

When this is done you can view the git log and verify the signature.

```shell
git log --show-signature
```

The `git verify-commit` options is also available. To verify the commit on HEAD you can use the following command:

```shell
git verify-commit HEAD
```

Use the verbose parameter to get more information:

```shell
git verify-commit -v HEAD
```

!!! tip Git can only verify known keys

    You may have noticed that your local git only will show a good signature for your own signed commits. For your local git to show a good signature for other contributing team members you will have to add their public key to your local allowed_signers file. The status on github.com will be correct as it hopefully knows the public keys for the signers.

!!! tip Sign git tags

    We have shown how to sign git commits. You can also sign git tags!


## Configure Github

At this stage in the guideline we are able to sign and verify the signature of locally committed changes. If you push your changes to github.com they will get the `Unverified` status. This indicate that Github has found a signature in the commit but it is not able to verify it. You can find more detailed information on the Github docs on [About commit signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification)

This makes sense. Github can not verify our signature, it does not have our public key. Telling Github about the public key we used to sign our commit is the next step.

### Adding public keys

We will add the public part of our SSH key to github.com.

- Print the public part of the key

```shell
cat ~/.ssh/git_ssh_signing_key_1.pub
```

- Copy the public key and add it as a new [Signing key](https://github.com/settings/ssh/new) to your profile on github.com. Provide a proper title. Key type must be "Signing Key".

If you now go back and look at the commits on github.com, those that were signed with the new key should have status `Verified`

If you select the `Verified` badge you will get information on the signer and the fingerprint of the public key that was used. You can find the finger print by [looking at the key](https://github.com/settings/keys) on your Github profile or by running ssh-keygen with the option to generate fingerprint locally:

```shell
ssh-keygen -lf ~/.ssh/git_ssh_signing_key_1
```

!!! Tip Vigilant Mode 

    Explore Github's [Vigilant Mode](https://docs.github.com/en/authentication/managing-commit-signature-verification/displaying-verification-statuses-for-all-of-your-commits#about-vigilant-mode) It should increase the trust level of signed commits yet another level.

## Enforce signed commits via Branch protection

We recommend that you protect important branches with branch protection rules on. This is a feature of Github that requires a Github Team or Github enterprise account.

The official documentation can be found in [Managing protected branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches)

We recommend the following **minimum** protection for important branches:

- Protect matching branches
    - Check "Require a pull request before merging" 
    - Check "**Require signed commits**"
    - Check "Do not allow bypassing the above settings"
- Rules applied to everyone including administrators
    - UnCheck "Allow force pushes"
    - UnCheck "Allow deletions"

## Signing on GitHub Codespaces

GitHub Codespaces can take care of setting up GPG signing keys inside the codespace on your behalf. It is trivial to set it up, but it has some security implications, so **do this exclusively for repositories you trust**. 

If you trust the repository (and its maintainers), signing in Codespaces can be enabled by following these steps:
- Open the [Codespaces settings](https://github.com/settings/codespaces) on GitHub
- Enable "GPG Verification"
- Choose `Selected Repositories` in the "Trusted Repositories" section, and add the relevant repository

See also [the official GitHub Documentation](https://docs.github.com/en/codespaces/managing-your-codespaces/managing-gpg-verification-for-github-codespaces)

If you cannot trust the content or the maintainers of a repository (eg, if you are contributing to a project owned by another company, or to an open source projects) and you want/need to sign your commits, it is better to use a local development setup rather than GitHub Codespaces. The problem is that the codespace could have been configured to run malicious code. That code could syphon the GPG signing keys that GitHub would automatically drop into the environment (and all other sorts of sensitive data you enter in the codespace). For more details, see [here](https://docs.github.com/en/codespaces/reference/security-in-github-codespaces).


  
## External resources

- We disagree with the premise of signed git commits not being useful in the [Should We Sign Git Commits? Probably Not!](https://medium.com/@michael.vittrup.larsen/should-we-sign-git-commits-probably-not-c09ad3c18393). Using git signatures are useful, but it's a not a silver bullet. The article contains relevant reflections advocating for focusing on building a foundation of trust through the review and approval of pull requests by multiple trusted individuals and the importance of a collective scrutiny process. **This we fully support**
- We are monitoring the [Git Sign project](https://docs.sigstore.dev/signing/gitsign/) of Sigstore. It contains a very interesting approach to the trust chain.
 
