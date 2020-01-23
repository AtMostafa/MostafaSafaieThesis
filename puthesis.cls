\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{puthesis}
         [2008/05/02 v1.4 Thesis class]
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\def\copyrightyear#1{\gdef\@copyrightyear{#1}}
\def\@copyrightyear{\number\year}
\long\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}
\long\def\@resume{\@latex@error{No \noexpand\resume given}\@ehc}
\newcommand*{\frontmatter}{
  \pagenumbering{roman}
  }
\newcommand*{\mainmatter}{\pagenumbering{arabic}}
\newcommand*{\makelot}{}
\newcommand*{\makelof}{}
\newcommand*{\makelos}{}
\newcommand*{\maketoc}{
  % Add ToC to the pdfbookmarks as a section, but not to the ToC itself.
  % only if we have the hyperref command that is necessary
  \ifdefined\pdfbookmark
     \phantomsection
     \pdfbookmark[1]{\contentsname}{Contents}
  \else
  \fi

  \tableofcontents
  \clearpage
}
%% Setup a command to add extra space only if in singlespacing mode
\newcommand*{\extravspace}[1]{\vspace{0in}}
%% Setup a command to set spacing for body text; also used to restore spacing after long tables in document
\newcommand*{\bodyspacing}{
  \doublespacing
}
%% Setup a command to set spacing for long tables, to be used manually in document
\newcommand*{\tablespacing}{
  \singlespacing
}
%% Command inserted into the document immediately after \begin{document} to place all frontmatter
%%   This was formerly named 'begincmd' and called below in \AtBeginDocument{}
%%   However, that is not compatible with package 'hyperref'. \tableofcontents needs
%%   to be declared from within the document itself. 
\newcommand*{\makefrontmatter}{
\bodyspacing
\frontmatter\maketitlepage\maketitlepageFR\makecopyrightpage\makeabstract\makeresume
\makeacknowledgements\makededication\pagestyle{fancy}\maketoc
\makelot\clearpage\makelof\clearpage\makelos
\clearpage\mainmatter
}
\long\def\acknowledgements#1{\gdef\@acknowledgements{#1}}
\def\dedication#1{\gdef\@dedication{#1}}
\newcommand{\maketitlepage}{{
  \thispagestyle{empty}
  \begin{figure}[h!]
    \begin{center}$
    \begin{array}{ccc}
      \includegraphics[width=.3\linewidth]{titlePage/logo-amu.pdf} &
      \includegraphics[width=.3\linewidth]{titlePage/logo-inserm.pdf} &
      \includegraphics[width=.3\linewidth]{titlePage/logo-amu.pdf}
    \end{array}$
    \end{center}
  \end{figure}
  {\fontfamily{put}\selectfont
  \begin{flushleft}
    \vspace{-1cm}
    \LARGE Aix-Marseille University\\
    \Large Doctoral School of Life and Health Sciences \\
    \vspace{0.1cm}
    \large Institut de Neurobiologie de la M\'{e}diterran\'{e}e \\
      \begin{center}
      \vspace{.5cm}
      \normalsize Dissertation Presented in Candidacy for the Degree of\\
      Doctor of Philosophy of Neuroscience\\
      \end{center}
    \vspace{.5cm}
      \begin{center}
          \Large Mostafa Safaie\\
          \vspace{.5cm}
          \textbf{\Large Embodied Time Estimation\\[-.5cm] and the Contribution of the Dorsal Striatum}\\
      \end{center}
      \vspace{2cm}
      \normalsize Defended on 28/04/2020 before the jury composed of:\\
  \end{flushleft}
  \vspace{0.1cm}
  \begin{tabular}{lll}
    Philippe Faure & Sorbonne University & Reviewer \\
    Nicolas Rougier & University of Bordeaux & Reviewer \\
    Joseph J. Paton & Champalimaud Centre for the Unknown & Examiner \\
    Jennifer T. Coull & Aix-Marseille University & Examiner \\
    David Robbe & Aix-Marseille University & Thesis Supervisor
  \end{tabular}
      
  \vspace{0.2cm}
  \begin{flushleft}\normalsize Num\'{e}ro national de th\`{e}se/suffixe local: 2019AIXM0001/001ED62
  \end{flushleft}
  }
  \clearpage
  }}
\newcommand{\maketitlepageFR}{{
    \thispagestyle{empty}
    \begin{figure}[h!]
      \begin{center}$
      \begin{array}{ccc}
        \includegraphics[width=.3\linewidth]{titlePage/logo-amu.pdf} &
        \includegraphics[width=.3\linewidth]{titlePage/logo-inserm.pdf} &
        \includegraphics[width=.3\linewidth]{titlePage/logo-amu.pdf}
      \end{array}$
      \end{center}
    \end{figure}
    {\fontfamily{put}\selectfont
    \begin{flushleft}
      \vspace{-1cm}
      \LARGE Aix-Marseille Universit\'{e}\\
      \Large Ecole Doctorale Sciences de la Vie et de la Sant\'{e} \\
      \vspace{0.1cm}
      \large Institut de Neurobiologie de la M\'{e}diterran\'{e}e \\
        \begin{center}
        \vspace{.5cm}
        \normalsize Th\`{e}se pr\'{e}sent\'{e}e pour obtenir le grade universitaire de docteur\\
        \end{center}
      \vspace{.5cm}
        \begin{center}
            \Large Mostafa SAFAIE\\
            \vspace{.5cm}
            \textbf{\Large Estimation du Temps D'incarnation\\[-.5cm] et Contribution du Striatum Dorsal}\\
        \end{center}
        \vspace{2cm}
        \normalsize Soutenue le 28/04/2020 devant le jury compos\'{e} de :\\
    \end{flushleft}
    \vspace{0.1cm}
    \begin{tabular}{lll}
      Philippe FAURE & Sorbonne Universit\'{e} & Rapporteur \\
      Nicolas ROUGIER & Universit\'{e} de Bordeaux & Rapporteur \\
      Joseph J. PATON & Champalimaud Centre for the Unknown & Examinateur \\
      Jennifer T. COULL & Aix-Marseille Universit\'{e} & Examinateur \\
      David ROBBE & Aix-Marseille Universit\'{e} & Directeur de th\`{e}se
    \end{tabular}
        
    \vspace{0.2cm}
    \begin{flushleft}\normalsize Num\'{e}ro national de th\`{e}se/suffixe local : 2019AIXM0001/001ED62
    \end{flushleft}
    }
    \clearpage
    }}
\newcommand*{\makecopyrightpage}{
  \thispagestyle{empty}
  \vspace*{0in}
  % \begin{center}
  %   \copyright\ Copyright by Mostafa Safaie, \@copyrightyear. \\
  %   All rights reserved.
  % \end{center}
  \clearpage}
\newcommand*{\makeabstract}{
  \newpage
  \phantomsection
  \addcontentsline{toc}{section}{Abstract}
  \begin{center}
  \Large \textbf{Abstract}
  \end{center}
  \@abstract
  \clearpage
  }
\newcommand*{\makeresume}{
  \newpage
  \phantomsection
  \addcontentsline{toc}{section}{R\'{e}sum\'{e}}
  \begin{center}
  \Large \textbf{R\'{e}sum\'{e}}
  \end{center}
  \@resume
  \clearpage
  }
\def\makeacknowledgements{
  \ifx\@acknowledgements\undefined
  \else
    \ifdefined\phantomsection
     % makes hyperref recognize this section properly for pdf links
     \phantomsection
    \else
    \fi

    \addcontentsline{toc}{section}{Acknowledgements}
    \begin{center}
      \Large \textbf{Acknowledgements}
    \end{center}
    \@acknowledgements
    \clearpage
  \fi
  }
\def\makededication{
  \ifx\@dedication\undefined
  \else
    \vspace*{1.5in}
    \begin{flushright}
      \@dedication
    \end{flushright}
    \clearpage
  \fi
  }
\DeclareOption{lot}{\renewcommand*{\makelot}{
  \ifdefined\phantomsection
    % makes hyperref recognize this section properly for pdf links
    \phantomsection
  \else
  \fi
  \addcontentsline{toc}{section}{List of Tables}\listoftables}}
\DeclareOption{lof}{\renewcommand*{\makelof}{
  \ifdefined\phantomsection
    % makes hyperref recognize this section properly for pdf links
    \phantomsection
  \else
  \fi
  \addcontentsline{toc}{section}{List of Figures}\listoffigures}}
\DeclareOption{los}{
  \renewcommand*{\makelos}{
    \RequirePackage{losymbol}
    \section*{List of Symbols\@mkboth {LIST OF SYMBOLS}{LIST OF SYMBOLS}}
    \@starttoc{los}
  \ifdefined\phantomsection
    % makes hyperref recognize this section properly for pdf links
    \phantomsection
  \else
  \fi
    \addcontentsline{toc}{section}{List of Symbols}
  }
}
\DeclareOption{singlespace}{
  \renewcommand*{\bodyspacing}{
  \singlespacing
  }
  %% Add extra space only if in singlespacing mode
  \renewcommand*{\extravspace}[1]{\vspace{#1}}
}
%% Doublespacing is the default for the thesis -- need not be declared.
\DeclareOption{doublespacing}{
  \renewcommand*{\bodyspacing}{
  \doublespacing
  }
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
%% Not necessary to specify the point size - we inherit it from above
%% \LoadClass[12pt]{report}
\LoadClass{report}
\setlength{\oddsidemargin}{.5in}   %{.4375in}
\setlength{\evensidemargin}{.5in} %{.4375in}
\setlength{\topmargin}{-.5in}  %{-.5625in}
\setlength{\footskip}{.25in} % to put page number 3/4" from the bottom of the page (1/4" from bottom of body text)
\setlength{\textheight}{9in}
\setlength{\textwidth}{6in}

%%% Alter LaTeX defaults to try to eliminate all widows and orphans
\clubpenalty=10000
\widowpenalty=10000

%%% try to avoid overfull lines by limiting how far it is okay to exceed the margins
%%% http://www.tex.ac.uk/cgi-bin/texfaq2html?label=overfull
\setlength{\emergencystretch}{2em}

\long\def\abstract#1{\gdef\@abstract{#1}}
\long\def\resume#1{\gdef\@resume{#1}}
%% 'begincmd' no longer used -- insert \makefrontmatter in the document instead. See above. 
%\AtBeginDocument{\begincmd}
\endinput
%% 
%% End of file `puthesis.cls'.