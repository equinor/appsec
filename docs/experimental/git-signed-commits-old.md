# 🔏 Git Signed Commits: A Guide for Proper Folks Who Ain’t Raised by Wolves 🧐

Now gather ‘round, you young scallywags, and let an old hand set you straight. Back in my day, a man’s word was his bond, and a signature was as good as gold. Nowadays, any two-bit scoundrel with a typewriter hooked up to a lightning machine can go fiddlin’ with your code, impersonatin’ honest folk, and muckin’ things up faster than a hog in a henhouse. 💨

**That’s why you gotta sign your Git commits, just like an honest citizen signs a check down at the bank.** 🏦

If you don’t, well… don’t come cryin’ when some rascal tampers with your code and the whole shebang crumbles like a biscuit in hot coffee. ☕🍪

## 📜 The Rules (And You Better Follow ‘Em, Y’hear?)

✅ **Sign every Git commit you make.** A commit without a signature is like a contract written in invisible ink—ain’t worth a plugged nickel. 💰

✅ **Use SSH keys with a passphrase.** That’s a password, son. And make it a good one. "123456" ain’t a passphrase, it’s an invitation for hooligans.

✅ **Keep separate keys for signin’ and loggin’ in.** You wouldn’t use the same key for your house and your barn, would ya?

✅ **Make sure your branch rules require signed commits.** Otherwise, you might as well leave your front door wide open and hope the raccoons don’t move in.

✅ **GitHub Codespaces might sign commits for ya, but don’t trust it more than your own two hands.** Machines are tricky little devils, and you never know when one’s gonna go haywire. 🤖🔥

## 🔐 SSH Key Signing (The Best Way for Most Folks)

### 1. 🛠️ Generate a Signing SSH Key

Open up your terminal and generate a dedicated SSH key just for signing your Git commits:

```bash
ssh-keygen -t ed25519 -f ~/.ssh/git_ssh_signing_key_1 -C "Created on <date>, for [your_username] on github.com"
```

Make sure to give it a good passphrase, not something like password123. A weak passphrase is like lockin’ your door with a shoelace.

### 2. 🧠 Add the Key to Your SSH Agent

To save yourself from typing the passphrase every time, add the key to your SSH agent:

```bash
ssh-add ~/.ssh/git_ssh_signing_key_1
```

### 3. 🧾 Tell Git to Use This Key for Signing

Git’s like a mule—it only listens when you speak plain. So tell it exactly what to do:

```bash
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/git_ssh_signing_key_1.pub
git config --global commit.gpgsign true
```

Now Git will sign your commits automatically, no fuss, no muss.

## 4. 🔍 Check That Your Commits Are Signed

To make sure it’s working and you didn’t fat-finger anything, run this:

```bash
git log --show-signature
```

If it shows your signature, you did it right. If not, go back and double-check your setup. 🎩

### 5. 🗝️ Add Your Public Signing Key to GitHub

GitHub ain’t a mind reader. You’ve got to tell it about your key.

First, get your public key:

```bash
cat ~/.ssh/git_ssh_signing_key_1.pub
```

### 6. 🚪 Require Signed Commits on Protected Branches (Optional but Smart)

To keep your project clean and avoid unwanted shenanigans, enforce signed commits:

1. Go to your **GitHub repository**
1. Navigate to **Settings → Branches**
1. Under **Branch protection rules**, click **Add rule**
1. Select your main branch (usually `main` or `master`)
1. Check **Require signed commits**

Now only signed commits can get through, like a proper gated community. 🚧

## 🎤 Final Words from an Old-Timer Who’s Seen Some Things

Now listen, I ain’t sayin’ you gotta follow these rules. You’re a grown person, you can do what you want. **But if you don’t sign your commits,** don’t come bellyachin’ when some no-good scoundrel impersonates you and sneaks nonsense into your project. 🎭

Back in my day, we didn’t have none of this "Git" business. We wrote our code by hand, uphill both ways, in the snow, and we liked it! 📝 **But if we had Git, you better believe we’d sign our work.**

So quit yer lollygaggin’, set up signed commits, and keep your code cleaner than a Sunday suit. 👔

Or don’t. But don’t come cryin’ when your project turns into a three-ring circus. 🎪
