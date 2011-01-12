%%
%% NTNU LaTeX Thesis Class
%%

\ProvidesClass{ntnuthesis}
\NeedsTeXFormat{LaTeX2e}

% Based on the memoir class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions
\LoadClass{memoir}

%%
%% Graphics
%%

\RequirePackage{graphicx}

%%
%% Fonts
%%

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8x]{inputenc}
\RequirePackage{lmodern}
\RequirePackage{MinionPro}

\newfont{\chapnum}{eurb10 scaled 10000}

\newcommand{\lowercaps}[1]{\textsc{\MakeLowercase{#1}}}
\newcommand{\uppercaps}[1]{\textsc{\MakeUppercase{#1}}}

%%
%% Line breaking
%%

\RequirePackage[final=true,step=1]{microtype}
\RequirePackage{ragged2e}

%%
%% Colors
%%

\RequirePackage{xcolor}

\definecolor{red}{HTML}{AD1737}
\definecolor{brown}{HTML}{990000}
\definecolor{bar}{HTML}{8D9965}

\definecolor{chapnum}{gray}{0.6}
\definecolor{sectionnum}{gray}{0.50}
\definecolor{largeornament}{gray}{0.85}
\definecolor{smallornament}{gray}{0.65}

\colorlet{title}{red}
\colorlet{partnum}{red}
\colorlet{urlcolor}{brown}
\colorlet{tocchapnum}{brown}

%%
%% Division styles
%%

% Chapter style
\makechapterstyle{ntnu}{%
  \renewcommand{\printchaptername}{}
  \renewcommand{\chapternamenum}{}
  \renewcommand{\printchapternum}{%
    \marginpar{%
      \vspace{-40pt}
      \color{chapnum}\chapnum \thechapter
      \vspace{20pt}
    }%
  }%
  \renewcommand{\afterchapternum}{}
  \renewcommand{\printchaptertitle}[1]{%
    \raggedright\LARGE\uppercaps{##1}
  }%
}

% Section style
\setsecheadstyle{\raggedright\Large\scshape\MakeLowercase}
\setsubsecheadstyle{\raggedright\large\itshape}
\setsubsubsecheadstyle{\raggedright\itshape}

%%
%% Typograhy
%%

% Prints a trailing space in a smart way.
\RequirePackage{xspace}

% hair space
\newcommand{\hairsp}{\hspace{1pt}} 

\newcommand{\ie}{\textit{i.\hairsp{}e.}\xspace}
\newcommand{\eg}{\textit{e.\hairsp{}g.}\xspace}

\providecommand\newthought[1]{%
  \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
  \noindent\textsc{#1}%
}

% No orphans
\clubpenalty = 500
\widowpenalty = 1000

%%
%% Hyperlinks
%%

%%
%% Hyperlinks
%%

\RequirePackage[pdftex,plainpages=false]{hyperref}

% break also on hyphens inside the \url command
\def\UrlBreaks{\do\.\do\@\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]%
  \do\)\do\,\do\?\do\'\do+\do\=\do\#\do-} % \do- is new!

\urlstyle{sf}

\hypersetup{%
  colorlinks=true,
  linkcolor=black,
  anchorcolor=black,
  citecolor=black,
  urlcolor=urlcolor,
  breaklinks,
  pdfborder=0 0 0,
}

%%
%% Declerative formatting
%%

% Quotation
\newcommand{\q}[1]{``#1''}

% Items to attend to
\newcommand{\todo}[1]{$\bigotimes$ #1 $\bigotimes$}

% Term (first usage)
\newcommand{\term}[1]{\textit{{#1}}}

% old style &
\newcommand{\oldand}{\textsw{\& }}

% Abbreviations (mostly acronyms, but all full caps abbreviations)
\let\abbr\lowercaps

%%
%% Lists
%%

\RequirePackage{paralist}

% Definitions in lists
\newcommand{\iterm}[1]{\item \term{#1.}}

% Cited definitions in lists
\newcommand{\citerm}[2]{\item \term{#1}}

% Enumeratable list
\newenvironment{enum}{%
  \begin{list}{\arabic{enumi}}{%
    \setlength{\topsep}{\onelineskip}
    \setlength{\partopsep}{0pt}
    \setlength{\parsep}{\parskip}
    \setlength{\itemsep}{\parskip}
    \setlength{\leftmargin}{0pt}
    \setlength{\itemindent}{0pt}
    \usecounter{enumi}
  }
}{\end{list}}

% Itemized list
\newenvironment{items}{%
  \begin{list}{\textbullet}{%
    \setlength{\topsep}{\onelineskip}
    \setlength{\partopsep}{0pt}
    \setlength{\parsep}{\parskip}
    \setlength{\itemsep}{\parskip}
    \setlength{\leftmargin}{0pt}
    \setlength{\itemindent}{0pt}
  }
}{\end{list}}

\newenvironment{enump}{%
  \begin{inparaenum}[\itshape 1\upshape)]
}{\end{inparaenum}}

% Table of Contents
\maxtocdepth{section}

\renewcommand{\cftpartfont}{\Large}
\renewcommand{\cftpartleader}{}
\renewcommand{\cftpartafterpnum}{\cftparfillskip}
\cftsetindents{part}{1.5em}{0em}
\renewcommand{\partnumberline}[1]{}
\cftpagenumbersoff{part}

\renewcommand{\cftchapterfont}{\large}
\renewcommand{\cftchapterpagefont}{\normalsize\color{tocchapnum}}
\renewcommand{\cftchapterpresnum}{\hspace*{-1.5em}\color{tocchapnum}}
\cftsetindents{chapter}{1.5em}{0em}
\renewcommand{\cftchapterleader}{}
\renewcommand{\cftchapterafterpnum}{\cftparfillskip}

\renewcommand{\cftsectionfont}{\small}
\renewcommand{\cftsectionpagefont}{\small\color{sectionnum}}
\cftsetindents{section}{1.5em}{2.3em}
\renewcommand{\cftsectionnumwidth}{0em}
\renewcommand{\cftsectionleader}{}
\renewcommand{\cftsectionafterpnum}{\cftparfillskip}

\def\cftsectionpresnum #1\@cftasnum{}

% List of Figures/Tables
\renewcommand{\cftfigureleader}{ }
\renewcommand{\cftfigureafterpnum}{\cftparfillskip}
\renewcommand{\cftfigurepagefont}{\normalsize\color{tocchapnum}}

\renewcommand{\cfttableleader}{ }
\renewcommand{\cfttableafterpnum}{\cftparfillskip}
\renewcommand{\cfttablepagefont}{\normalsize\color{tocchapnum}}

%%
%% Quotations and citations
%%

\RequirePackage{natbib}

% Paragraph/page reference
\newcommand{\p}[1]{p.~#1}
\newcommand{\pp}[2]{pp.~#1--#2}

% Full width quote environment
\renewenvironment{quote}{%
  \list{}{%
    \setlength{\topsep}{\baselineskip}
    \setlength{\partopsep}{0pt}
    \setlength{\itemindent}{0pt}
    \setlength{\listparindent}{0pt}
    \setlength{\leftmargin}{0pt}
  }%
  \itshape\item[]
}{\endlist}

%%
%% Tables
%%

\usepackage{booktabs} % nicely typeset tabular material
\usepackage{tabularx} % new column specifier X to stretch column

\newenvironment{margintable}{%
  \setlength{\parindent}{0pt}
  \vspace*{\baselineskip}
  \table
}{\endtable}

\newcommand\tableref[1]{%
  Table~\ref{table:#1}%
}

%%
%% Title
%%

\author{Kim Joar Bekkelund}

% Titlepage
\renewcommand{\maketitle}{%
  \calccentering{\unitlength}
  \begin{adjustwidth*}{\unitlength}{-\unitlength}
  \begin{titlingpage}
    \thispagestyle{title}
    \setlength{\parindent}{0pc}
    \centering

    \null\vspace{3cm}
    \noindent
    
    {\Huge\uppercaps{Succeeding with Freemium}} \\
    
    \vspace{2cm}

    {\Large\color{title}{\emph{Exploring Why Companies Have}}} \\ 
    \vspace{0.3cm}
    {\Large\color{title}{\emph{Succeeded \oldand Failed With Freemium}}} \\

    \vspace{2cm}
    
    {\large\@author} \\

    \vfill
    
    \itshape\large\textcolor{darkgray}{
      \noindent
      Supervisor: Karl Klingsheim \\
      \vspace{0.2cm}
      \noindent
      \abbr{NTNU}, Trondheim, \today \\
      \vspace{0.2cm}
      \noindent
      TIØ4530 Innovation and Entrepreneurship, Specialization Project \\
    }

    \clearpage
  \end{titlingpage}
  \end{adjustwidth*}
}

% \null\vspace{8pc}
% 
% {\Huge\color{title}\uppercaps{Social Navigation}} \\
% \vspace{2pc}
% {\Huge\textit{{on the}}} \\
% \vspace{2pc}
% {\Huge\color{title}\uppercaps{Social Web}} \\
% 
% \vspace{4pc}
% {\Large} \\
% \vspace{4pc}
% 
% {\Large\textit{{
%   Unobtrusive Prototyping of \\
%   \vspace{1pc}
%   Activity Streams in Established Spaces}}} \\
% 
% \vspace{5pc}
% 
% {\large\@author} \\
% 
% \vspace{2pc}
% 
% {\large August 2008} \\
% 
% \vspace{5pc}
% 
% \textit{
% Submitted in partial fulfillment of the requirements \\
% for the degree of Master of Science \\
% \vspace{1pc}
% to the \\
% \vspace{1pc}
% Department of Informatics \\
% Faculty of Mathematics and Natural Sciences \\
% University of Oslo \\
% }
% \vfill

% \title{
%   {\color{title}\uppercaps{Succeeding}} \\
%   \textit{with} \\
%   {\color{title}\uppercaps{Freemium}}
% }

%%
%% Bibliography
%%

\bibpunct{(}{)}{;}{a}{~}{,}

%%
%% Reference shorthands
%% 

\newcommand\chapterref[1]{%
  Chapter~\ref{chapter:#1}
  (p.~\pageref{chapter:#1})%
}
\newcommand\sectionref[1]{%
  \textsection~\ref{section:#1}
  (p.~\pageref{section:#1})%
}
\newcommand\appendixref[1]{%
  Appendix~\ref{appendix:#1}
  (p.~\pageref{appendix:#1})%
}

%%
%% Propositions
%%

\newcounter{propositions}
\newcommand\proposition[1]{%
  \addtocounter{propositions}{1}
  \vspace{\onelineskip}
  \noindent\ignorespaces
  \emph{Proposition~\arabic{propositions}}: #1
  \vspace{\onelineskip}
}