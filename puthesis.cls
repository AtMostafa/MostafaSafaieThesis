\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{puthesis}
         [2020/02/28 v1.5 Thesis class]
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{tikz}
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
\frontmatter\maketitlepage\makecopyrightpage\makeabstract\makeresume
\makeacknowledgements\makededication\pagestyle{fancy}\fancyhf{}\fancyfoot[C]{\thepage}\renewcommand{\headrulewidth}{0pt}\maketoc
\makelot\clearpage\makelof\clearpage\makelos
\clearpage\mainmatter
}
\long\def\acknowledgements#1{\gdef\@acknowledgements{#1}}
\def\dedication#1{\gdef\@dedication{#1}}
\newcommand{\maketitlepage}{{
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north east,inner sep=1cm] at (current page.north east)
               {\includegraphics[height=2.2cm,]{titlePage/logo-inmed.pdf}};
 \end{tikzpicture}
 \begin{tikzpicture}[remember picture,overlay]
   \node[anchor=north west,inner sep=1cm] at (current page.north west)
              {\includegraphics[height=2cm]{titlePage/logo-amu.pdf}};
\end{tikzpicture}
\begin{tikzpicture}[remember picture,overlay]
  \node[anchor=north,inner sep=1cm] at (current page.north)
             {\includegraphics[height=2cm]{titlePage/logo-inserm.pdf}};
\end{tikzpicture}
  {\fontfamily{put}\selectfont
  \begin{center}
    \vspace{1cm}
    \LARGE Aix-Marseille University\\
    \Large Doctoral School of Life and Health Sciences \\
    \large Institut de Neurobiologie de la M\'{e}diterran\'{e}e \\
      \begin{center}
      \vspace{.7cm}
      \normalsize Dissertation Presented in Candidacy for the Degree of\\
      Doctor of Philosophy of Neuroscience\\
      \end{center}
    \vspace{.7cm}
      \begin{center}
          \Large Mostafa Safaie\\
          \vspace{.5cm}
          \textbf{\Large Embodied Timing\\[-.5cm] and the Contribution of the Dorsal Striatum}\\
      \end{center}
    \end{center}
      \vspace*{\fill}
      \begin{flushleft}
      \normalsize Defended on 28/04/2020 before the jury composed of:\\
  \vspace{0.1cm}
  \begin{tabular}{lll}
    Philippe Faure & Sorbonne University & Reviewer \\
    Nicolas Rougier & University of Bordeaux & Reviewer \\
    Joseph J.\ Paton & Champalimaud Centre for the Unknown & Examiner \\
    Jennifer T.\ Coull & Aix-Marseille University & Examiner \\
    David Robbe & Aix-Marseille University & Thesis Supervisor
  \end{tabular}
      
  \vspace{0.2cm}
  \normalsize National thesis number/local suffix: 2020AIXM0065/012ED62
  \end{flushleft}
  }
  \clearpage
  }}
\newcommand{\maketitlepageFR}{{
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture,overlay]
      \node[anchor=north east,inner sep=1cm] at (current page.north east)
                 {\includegraphics[height=2.2cm,]{titlePage/logo-inmed.pdf}};
   \end{tikzpicture}
   \begin{tikzpicture}[remember picture,overlay]
     \node[anchor=north west,inner sep=1cm] at (current page.north west)
                {\includegraphics[height=2cm]{titlePage/logo-amu.pdf}};
  \end{tikzpicture}
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north,inner sep=1cm] at (current page.north)
               {\includegraphics[height=2cm]{titlePage/logo-inserm.pdf}};
  \end{tikzpicture}
  {\fontfamily{put}\selectfont
    \begin{center}
      \vspace{1cm}
      \LARGE Aix-Marseille Universit\'{e}\\
      \Large Ecole Doctorale Sciences de la Vie et de la Sant\'{e} \\
      \large Institut de Neurobiologie de la M\'{e}diterran\'{e}e \\
        \begin{center}
        \vspace{.7cm}
        \normalsize Th\`{e}se pr\'{e}sent\'{e}e pour obtenir le grade universitaire de docteur\\
        Discipline : Neurosciences\\
        \end{center}
      \vspace{.7cm}
        \begin{center}
            \Large Mostafa SAFAIE\\
            \vspace{.5cm}
            \textbf{\Large Estimation du Temps D'incarnation\\[-.5cm] et Contribution du Striatum Dorsal}\\
        \end{center}
      \end{center}
        \vspace*{\fill}
        \begin{flushleft}
        \normalsize Soutenue le 28/04/2020 devant le jury compos\'{e} de :\\
    \vspace{0.1cm}
    \begin{tabular}{lll}
      Philippe FAURE & Sorbonne Universit\'{e} & Rapporteur \\
      Nicolas ROUGIER & Universit\'{e} de Bordeaux & Rapporteur \\
      Joseph J.\ PATON & Champalimaud Centre for the Unknown & Examinateur \\
      Jennifer T.\ COULL & Aix-Marseille Universit\'{e} & Examinateur \\
      David ROBBE & Aix-Marseille Universit\'{e} & Directeur de th\`{e}se
    \end{tabular}
        
    \vspace{0.2cm}
    \normalsize Num\'{e}ro national de th\`{e}se/suffixe local : 2020AIXM0065/012ED62
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
    \thispagestyle{empty}
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