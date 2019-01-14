# Install AsciiDoctor

| Application Data ||
| ---| --- |
| Name        | Asciidoctor |
| Version     | 1.5.7.1+ |
| Arch        | 32 bit |
| Description | [Ruby](https://www.ruby-lang.org/en/) Based Documentation System |

>[AsciiDoctor](https://asciidoctor.org/) is a fast text processor and publishing
>tool-chain for converting AsciiDoc content to HTML5, DocBook, PDF, and other formats.
>
> --*The AsciiDoctor Project, AsciiDoctor.org*

## Helpful Links

- [Website](https://asciidoctor.org/)
- [Writers Guide](https://asciidoctor.org/docs/asciidoc-writers-guide/)
- [User Manual](https://asciidoctor.org/docs/user-manual/)
- [Quick Reference](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/)
- [CodeRay Live Demo](http://coderay.rubychan.de/)

## Installation

Installation is fairly straight forward from the command-line. Ensure you have
installed [Core Tools](Install-Core-Tools.md), then proceed with the following steps.

Use the programs menu or any means of opening a standard (non-administrator)
Command Prompt.

### Set Environment Variables

In the Command Prompt window, type the following

``` shell
cd /d (C|D):\JTSDK-Tools\tools\ruby\2.5.1-2\bin
setrbvars.cmd
```

| ![Set Environment](images/asciidoctor/asciidoctor.1.PNG?raw=true) |
|:--:|
| *Set Environment Variables* |

### Run Install Command

In the Command Prompt window, type the following

``` shell
gem install asciidoctor
asciidoctor --version
```

| ![Install Asciidoctor](images/asciidoctor/asciidoctor.2.PNG?raw=true) |
|:--:|
| *Install Asciidoctor* |

### Install CodeRay

In the Command Prompt window, type the following

``` shell
gem install coderay
```

| ![Install Coderay](images/asciidoctor/asciidoctor.3.PNG?raw=true) |
|:--:|
| *Install CodeRay Gem* |

This concludes installation of [AsciiDoctor](https://asciidoctor.org/) with
the addition of [CodeRay](http://coderay.rubychan.de).

## Next Step

Proceed to ==> [Qt Tools Installation](Install-Qt.md)