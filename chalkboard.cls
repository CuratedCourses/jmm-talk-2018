\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chalkboard}[2016/12/30 v0.0.1 Mostly blank Beamer class]

% pass options we don't know about off to beamer for processing so
% e.g. handout etc. will still work
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions*
% load class with departmental options
\LoadClass[10pt,aspectratio=169,t]{beamer}

%% Load additional packages and commands.

\RequirePackage{xcolor}
\RequirePackage{colortbl}
\RequirePackage{pgf}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{latexsym}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{pdfpages}
\RequirePackage{ulem}
\RequirePackage{rotating}

\usetikzlibrary{positioning, shapes}
\usetikzlibrary{decorations.pathmorphing}

\definecolor{shaded}{RGB}{70,60,255}
\usecolortheme[named=shaded]{structure}


\setbeamercolor{alerted_text}{fg=stressed}

\setbeamertemplate{navigation symbols}{}
\setbeamersize{text margin left=3mm} 
\setbeamersize{text margin right=3mm} 

\setbeamertemplate{sidebar right}{default}{}

\makeatletter
\define@key{beamerframe}{nofills}[true]{% top
  \beamer@frametopskip=0pt\relax%
  \beamer@framebottomskip=0pt\relax%
  \beamer@frametopskipautobreak=\beamer@frametopskip\relax%
  \beamer@framebottomskipautobreak=\beamer@framebottomskip\relax%
  \def\beamer@initfirstlineunskip{%
    \def\beamer@firstlineitemizeunskip{%
      \vskip-\partopsep\vskip-\topsep\vskip-\parskip%
      \global\let\beamer@firstlineitemizeunskip=\relax}%
    \everypar{\global\let\beamer@firstlineitemizeunskip=\relax}}
}
\makeatother

\newcommand{\defnword}[1]{\textbf{#1}}

\usepackage{amsthm}
\newtheorem*{conjecture}{Conjecture}

\newtheorem{observation}[theorem]{Observation}
%\newtheorem{definition}[theorem]{Definition}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{claim}[theorem]{Claim}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{question}[theorem]{Question}

\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\OO}{\mathbb{O}}
\newcommand{\HH}{\mathbb{H}}
\newcommand{\RP}{\mathbb{R}P}
\newcommand{\CP}{\mathbb{C}P}
\newcommand{\HP}{\mathbb{H}P}
\newcommand{\OP}{\mathbb{O}P}
\DeclareMathOperator{\Spin}{Spin}
\DeclareMathOperator{\Homeo}{Homeo}
\DeclareMathOperator{\SO}{SO}
\DeclareMathOperator{\fiber}{fiber}
\DeclareMathOperator{\proj}{proj}

\newcommand{\LL}{\mathbb{L}}
\newcommand{\setbackgroundblack}{%
\usebackgroundtemplate{
\begin{pgfpicture}{0in}{0in}{\paperwidth}{\paperheight}
\color{black}
\pgfrect[fill]{\pgfxy(0,0)}{\pgfpoint{\paperwidth}{\paperheight}}
\end{pgfpicture}
}
}

\newcommand{\setbackgroundgreen}{%
\usebackgroundtemplate{
\begin{pgfpicture}{0in}{0in}{\paperwidth}{\paperheight}
\color{red!50!black}
\pgfrect[fill]{\pgfxy(0,0)}{\pgfpoint{\paperwidth}{\paperheight}}
\end{pgfpicture}
}
}

\newcommand{\sectionslide}[1]{%
\setbackgroundblack
\begin{frame}[nofills]
\Huge
\vfill
\scaletowidth{\textwidth}{\textcolor{white}{\textbf{#1}}}
\vfill
\end{frame}
\clearbackgroundpicture
}

\newcommand{\giantmessage}[1]{%
\setbackgroundgreen
\begin{frame}[nofills]
\Huge
\vfill
\scaletowidth{\textwidth}{\textcolor{white}{#1}}
\vfill
\end{frame}
\clearbackgroundpicture
}

\definecolor{FootColor}{rgb}{0.322,0.322,0.322}%
\definecolor{FootBackgroundColor}{rgb}{1,1,1}%

\setbeamercolor{bottomcolor}{fg=black,bg=gray!15!white}

%\setbeamertemplate{footline}{%
%\usebeamerfont{structure}
%\footnotesize
%\begin{tikzpicture}[overlay,remember picture]%
%  \node[opacity=0.8,text opacity=1,anchor=base west,yshift=2pt,xshift=-0.5mm,color=FootColor,fill=FootBackgroundColor] (website) at (current page.south west) {mooculus.osu.edu};
%  \node[opacity=0.8,text opacity=1,anchor=base east,yshift=2pt,xshift=0.5mm,color=FootColor,fill=FootBackgroundColor] (twitter) at (current page.south east) {\#mooculus};
%\end{tikzpicture}
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% stack two things so that they have the same size
\newlength{\firstline}
\newlength{\secondline}
\newcommand{\stacksame}[2]{%
\setlength{\firstline}{\widthof{#1}}%
\setlength{\secondline}{\widthof{#2}}%
\pgfmathsetmacro{\myratio}{\firstline/\secondline}%
\shortstack{#1\\\scalebox{\myratio}{#2}}}

\newlength{\myscalewidth}
\newcommand{\scaletowidth}[2]{%
\setlength{\myscalewidth}{\widthof{#2}}%
\pgfmathsetmacro{\myscaleratio}{#1/\myscalewidth}%
\scalebox{\myscaleratio}{#2}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% I like words in front of faded images

\newcommand{\setbackgroundpicturewhite}[1]{%
\definecolor{FootColor}{rgb}{0.322,0.322,0.322}%
\definecolor{FootBackgroundColor}{rgb}{1,1,1}%
\setbeamercolor{bottomcolor}{fg=black,bg=gray!15!white}%
\usebackgroundtemplate{%
\begin{tikzpicture}[overlay,remember picture]%
\draw[fill=white] (current page.north west) rectangle (current page.south east);%
\node[fill=white,minimum width=\paperwidth,minimum height=\paperheight,yshift=1.5mm] [anchor=north west] (mynode) {\hspace{-1.5mm}\includegraphics[width=\paperwidth]{#1}};%
\end{tikzpicture}%
}}


\newcommand{\settallbackgroundpicturewhite}[1]{%
\definecolor{FootColor}{rgb}{0.322,0.322,0.322}%
\definecolor{FootBackgroundColor}{rgb}{1,1,1}%
\setbeamercolor{bottomcolor}{fg=black,bg=gray!15!white}%
\usebackgroundtemplate{%
\begin{tikzpicture}[overlay,remember picture]%
\draw[fill=white] (current page.north west) rectangle (current page.south east);%
\node[minimum width=\paperwidth,minimum height=\paperheight,yshift=1.5mm] [anchor=north west] (mynode) {\hspace{-1.5mm}\includegraphics[height=\paperheight]{#1}};%
\end{tikzpicture}%
}}


\newcommand{\settallbackgroundpictureblack}[1]{%
\definecolor{FootColor}{rgb}{0.678,0.678,0.678}%
\definecolor{FootBackgroundColor}{rgb}{0,0,0}%
\setbeamercolor{bottomcolor}{fg=black,bg=gray!15!white}%
\usebackgroundtemplate{%
\begin{tikzpicture}[overlay,remember picture]%
\draw[fill=black] (current page.north west) rectangle (current page.south east);%
\node[minimum width=\paperwidth,minimum height=\paperheight,yshift=1.5mm] [anchor=north west] (mynode) {\hspace{-1.5mm}\includegraphics[height=\paperheight]{#1}};%
\end{tikzpicture}%
}}


\newcommand{\setbackgroundpictureblack}[1]{%
\definecolor{FootColor}{rgb}{0.678,0.678,0.678}%
\definecolor{FootBackgroundColor}{rgb}{0,0,0}%
\setbeamercolor{bottomcolor}{fg=white,bg=gray!15!black}%
\usebackgroundtemplate{%
\begin{tikzpicture}[overlay,remember picture]%
\draw[fill=black] (current page.north west) rectangle (current page.south east);%
\node[minimum width=\paperwidth,minimum height=\paperheight,yshift=1.5mm] [anchor=north west] (mynode) {\hspace{-1.5mm}\includegraphics[width=\paperwidth]{#1}};%
\end{tikzpicture}%
}}


\newcommand{\setdarkbackgroundpictureblack}[1]{%
\definecolor{FootColor}{rgb}{0.678,0.678,0.678}%
\definecolor{FootBackgroundColor}{rgb}{0,0,0}%
\setbeamercolor{bottomcolor}{fg=white,bg=gray!15!black}
\usebackgroundtemplate{%
\begin{tikzpicture}[overlay,remember picture]%
\draw[fill=black] (current page.north west) rectangle (current page.south east);%
\node[minimum width=\paperwidth,minimum height=\paperheight,yshift=1.5mm] [anchor=north west] (mynode) {\hspace{-1.5mm}\includegraphics[width=\paperwidth]{#1}};%
\draw[fill=black,opacity=0.75] (current page.north west) rectangle (current page.south east);%
\end{tikzpicture}%
}}%


\newcommand{\setdarkbackgroundpicturewhite}[1]{%
\definecolor{FootColor}{rgb}{0.322,0.322,0.322}%
\definecolor{FootBackgroundColor}{rgb}{1,1,1}%
\setbeamercolor{bottomcolor}{fg=black,bg=gray!15!white}
\usebackgroundtemplate{%
\begin{tikzpicture}[overlay,remember picture]%
\draw[fill=white] (current page.north west) rectangle (current page.south east);%
\node[minimum width=\paperwidth,minimum height=\paperheight,yshift=1.5mm] [anchor=north west] (mynode) {\hspace{-1.5mm}\includegraphics[width=\paperwidth]{#1}};%
\draw[fill=white,opacity=0.75] (current page.north west) rectangle (current page.south east);%
\end{tikzpicture}%
}}%

\newcommand{\settalldarkbackgroundpicturewhite}[1]{%
\definecolor{FootColor}{rgb}{0.322,0.322,0.322}%
\definecolor{FootBackgroundColor}{rgb}{1,1,1}%
\setbeamercolor{bottomcolor}{fg=black,bg=gray!15!white}
\usebackgroundtemplate{%
\begin{tikzpicture}[overlay,remember picture]%
\draw[fill=white] (current page.north west) rectangle (current page.south east);%
\node[minimum width=\paperwidth,minimum height=\paperheight,yshift=1.5mm] [anchor=north west] (mynode) {\hspace{-1.5mm}\includegraphics[height=\paperheight]{#1}};%
\draw[fill=white,opacity=0.75] (current page.north west) rectangle (current page.south east);%
\end{tikzpicture}%
}}%


\newcommand{\settalldarkbackgroundpictureblack}[1]{%
\definecolor{FootColor}{rgb}{0.678,0.678,0.678}%
\definecolor{FootBackgroundColor}{rgb}{0,0,0}%
\setbeamercolor{bottomcolor}{fg=black,bg=gray!15!white}
\usebackgroundtemplate{%
\begin{tikzpicture}[overlay,remember picture]%
\draw[fill=black] (current page.north west) rectangle (current page.south east);%
\node[minimum width=\paperwidth,minimum height=\paperheight,yshift=1.5mm] [anchor=north west] (mynode) {\hspace{-1.5mm}\includegraphics[height=\paperheight]{#1}};%
\draw[fill=black,opacity=0.75] (current page.north west) rectangle (current page.south east);%
\end{tikzpicture}%
}}%

\newcommand{\clearbackgroundpicture}{\usebackgroundtemplate{}%
\definecolor{FootColor}{rgb}{0.322,0.322,0.322}%
\definecolor{FootBackgroundColor}{rgb}{1,1,1}%
\setbeamercolor{bottomcolor}{fg=black,bg=gray!15!white}
}

\definecolor{osugray}{HTML}{5e6061}
\definecolor{ccgray}{HTML}{a7b1a6}

\newcommand{\whitebackground}{\setbeamercolor{background canvas}{bg=white,fg=black}\usebeamercolor[fg]{background canvas}}
\newcommand{\blackbackground}{\setbeamercolor{background canvas}{bg=black,fg=white}\usebeamercolor[fg]{background canvas}}


\endinput
