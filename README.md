# Brew Formula: Node with FDK

This Brew formula automates the installation process for Node.js version 18.18.2 and the Freshworks Developer Kit (FDK) in a custom folder. It also provides instructions on how to activate the FDK in a new terminal session.

## Prerequisites

Before installing the FDK, make sure your Homebrew installation is up to date. You can upgrade Homebrew to the latest version by running:

```bash
brew update
```


## Installation

First, tap the repository containing the FDK formula:

```bash
brew tap freshworks-developers/homebrew-tap
```

Then, install the FDK:

```bash
brew install fdk
```

## Usage

After tapping the repository and installing the FDK, the formula performs the following tasks:

1. Downloads and installs Node.js version 18.18.2 in a custom folder.
2. Installs the Freshworks Developer Kit (FDK) in the same custom folder.

Once installed, you can use the FDK by sourcing the `path.bash.inc` file in a new terminal session using the following command:

```bash
source "$(brew --repository freshworks-developers/homebrew-tap)/path.bash.inc"
```

This command sets up the necessary environment variables and configurations required for using the FDK.

## Verification

To verify that the FDK has been successfully installed, you can check its version by running the following command:

```bash
fdk -v
```

This command should output the version of the FDK installed on your system.

## Uninstalling FDK

To uninstall the Freshworks Developer Kit (FDK) installed via Homebrew, run the following command:

```bash
brew uninstall fdk
```

This command will remove the FDK from your system.

## Untapping Repository

If you no longer need to use formulas from the `freshworks-developers/homebrew-tap` repository, you can untap it using the following command:

```bash
brew untap freshworks-developers/homebrew-tap
```

This will remove the tap from your Homebrew setup.

## Note

- This formula assumes that the custom folder specified for installation is appropriate for your system. If you need to customize the installation location, please modify the formula accordingly.

- Make sure to have Homebrew installed on your system before running the installation command.

- Make sure to verify if you want to uninstall FDK and untap the repository as these actions are irreversible and will remove all associated packages and formulas from your system.



## Feedback and Issues

If you encounter any issues or have feedback regarding this formula, please report them to [freshworks-developers/homebrew-tap](https://github.com/freshworks-developers/homebrew-tap). Your feedback is highly appreciated and helps improve the formula for everyone.

## License

This formula is released under the [MIT License](LICENSE). Feel free to modify and distribute it according to your needs.