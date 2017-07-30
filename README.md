# Report Template

## Prerequisites

You want to have the following things installed in order to use this template:
 * A LaTeX backend (e.g. [TeX Live](https://www.tug.org/texlive) or
  [MikTeX](https://miktex.org))
 * A comfortable text editor (e.g. [Notepad++](https://notepad-plus-plus.org)),
   a LaTeX frontend (e.g. [TeXstudio](http://www.texstudio.org)),
   or an R frontend (e.g. [RStudio](https://www.rstudio.com))
 * A BibTeX manager (e.g. [JabRef](http://www.jabref.org))
 * [R](https://www.r-project.org) with the [knitr](https://yihui.name/knitr)
   library installed.

## HowTo

To create a PDF file manually (i.e. if you don't use a LaTeX frontend), you need
to call:
 * `Rscript -e "library(knitr); knit('report_en.Rnw')"`
 * `pdflatex report_en`
 * `bibtex report_en`
 * `pdflatex report_en`
 * `pdflatex report_en`

There is also a German version of the report remplate called `report_de.Rnw`.

**Attention**: There are problems with BibTeX if you are using RStudio. It seems
not work from within RStudio so you need to resort to the manual file creation.

## Good to know

The two templates both use the same document class `agse-empir-report` which
comes with a few tweaks (all of which are also demonstrated in the default
template content):
 * The new commands `\authorName{}` and `\authorMail{}` to format the author
   information.
 * The commands `\section{}` and `\subsection{}` are altered and have an
   optional parameter to indicate the author of the corresponding text part.
 * Exmples of inline R code with `\Sexpr{}` and regular knitr blocks
   (`<<>>= ... @`) with both tables and plots.

## Merge requests are welcome

Feel free to fork this repository and issue a merge request.
