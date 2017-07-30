\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{agse-empir-report}[2017/05/19 v0.1 AGSE Empirical SE Report]

\LoadClass[10pt,a4paper,twocolumn]{article}

%%% Language Settings
% Default language is English
\newcommand{\lang}{english}
\DeclareOption{de}{\renewcommand{\lang}{ngerman}}  % 'de' for German
\DeclareOption{en}{\renewcommand{\lang}{english}}  % 'en' for English
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\usepackage[\lang]{babel}

%%% Encoding
\RequirePackage[utf8]{inputenc} % Allow Umlauts in input
\RequirePackage{ae,aecompl,aeguill} % Use T1 Encoding but keep CM fonts

%%% Layout
\RequirePackage{fullpage}
\pagestyle{empty}

%%% Font selection
\RequirePackage{mathpazo} % Get a font like Palatino
\RequirePackage{helvet}   % Helvetica for sffamily

%%% Hyperlinks
\RequirePackage{hyperref}

%%% Graphics
\RequirePackage{graphicx}

%%% BibTeX
\RequirePackage[numbers,sort&compress]{natbib}
\bibliographystyle{plain}

%%% Tables
\RequirePackage{multirow}
\RequirePackage{booktabs}


%%% Title formatting
\let\titleOrig\title
\renewcommand{\title}[1]{\titleOrig{\sffamily\bfseries{#1}}}

% No page number on page w/ title
\let\maketitleOrig\maketitle
\renewcommand{\maketitle}{\maketitleOrig\thispagestyle{empty}}

% Author formatting
\newcommand{\authorName}[1]{\sffamily{#1}\\}
\newcommand{\authorMail}[1]{\normalsize\sffamily{#1}}

% No date in title
\date{}

%%% Abstract formatting
\let\abstractOrig\abstract
\let\endabstractOrig\endabstract
\renewenvironment{abstract}{\abstractOrig\small}{\endabstractOrig}

%%% Section formatting
\RequirePackage{titlesec}
\titlespacing*{\section}{0pt}{*2}{*1}
\titleformat{\section}{\large\bfseries}{\thesection.}{0.5em}{}
\titlespacing*{\subsection}{0pt}{*1.3}{*0.5}
\titleformat{\subsection}{\large\itshape}{\thesubsection}{0.5em}{}
\titlespacing*{\subsubsection}{0pt}{*1.3}{*0.5}
\titleformat{\subsubsection}{\itshape}{\thesubsubsection}{0.5em}{}

% Optional author information in sections and subsections
\RequirePackage{xifthen}
\newcommand{\secauthor}[1]{\texorpdfstring{\hfill\small\sffamily\mdseries\upshape{(#1)}}{}}
\let\sectionOrig\section
\renewcommand{\section}[3][]{%
    \ifthenelse{\isempty{#1}}{%
        \ifthenelse{\equal{#2}{*}}{%
            \sectionOrig*{#3}%
        }{%
            \sectionOrig{#2}%
        }%
    }{%
        \sectionOrig{#2\secauthor{#1}}%
    }%
}
\let\subsectionOrig\subsection
\renewcommand{\subsection}[2][]{%
    \ifthenelse{\isempty{#1}}{%
        \subsectionOrig{#2}%
    }{%
        \subsectionOrig{#2\secauthor{#1}}%
    }%
}

%%% Separated, one-column appendix
\let\appendixOrig\appendix
\renewcommand{\appendix}{\clearpage\onecolumn\appendixOrig}
