%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LaTeX Resume Template - Class File
% https://github.com/rohit-gohri/resume-template
%
% This class file defines the structure and design of the template. For content see the `resume.tex` file.
%
% Version: v1.0.0 (2020/05/04)
% By Rohit Gohri (https://rohit.page)
% 
% Copyright (C) 2021 by Rohit Gohri
%
%%%%%%%%%%%% Based On: %%%%%%%%%%%%
% Medium Length Professional CV
% 
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
% 
% Trey Hunner (http://www.treyhunner.com/)
% Version 2.0 (8/5/13)
%
% Copyright (C) 2010 by Trey Hunner
% 
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
% 
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2020/05/03 v1.0.0 Resume Class]

\LoadClass[12pt,A4]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{babel}
\usepackage[stretch=10]{microtype}
\usepackage[sc]{mathpazo} % Required for `Palatino` font
\usepackage{hyperref} % Required for creating links (\href)
\usepackage{xcolor}
\usepackage{trimspaces} % Required for triming variable values (https://tex.stackexchange.com/a/484290)
\usepackage{fontawesome} % Required for icons. List of available icons at http://ctan.imsc.res.in/fonts/fontawesome/doc/fontawesome.pdf
\usepackage{datetime} % Required for custom date formatting
\usepackage[left=0.75in,top=0.75in,right=0.75in,bottom=0.75in]{geometry} % Required for setting Document margins
\usepackage{scrextend}
\pagestyle{empty} % Suppress page numbers

\hypersetup{
	colorlinks={true}, %Colours links instead of ugly boxes
	linkcolor={red!50!black}, %Colour of internal links
	citecolor={blue!50!black}, %Colour of citations
	% urlcolor={blue!40!black}, %Colour for external hyperlinks
	urlcolor={black}, %Colour for external hyperlinks
	pdftitle={Resume}
}

\newdateformat{monthyeardate}{
	\shortmonthname[\THEMONTH]. \THEYEAR
}
\newdateformat{yeardate}{
	\THEYEAR
}

\newcommand{\fmtdate}[3][1]{%
	\unskip{% group start to scope date name
		\ifthenelse{\equal{#2}{}}{% If the 2nd arg is not provided only print the year
			\newdate{anon}{#1}{1}{#3}%
			\yeardate\displaydate{anon}%
		}{%
			\newdate{anon}{#1}{#2}{#3}%
			\monthyeardate\displaydate{anon}%
}}}

\newcommand{\draft}[2][false]{%
	{% group start to scope date name
		% From: https://tex.stackexchange.com/a/243879
		\newbox\anonvhbox
		\newboolean{IncludeAnonItem}
		\setboolean{IncludeAnonItem}{#1}
		\setbox\anonvhbox\vbox{%
			#2
			\unskip\unpenalty\unpenalty}
		\ifthenelse{\boolean{IncludeAnonItem}}{
			\unvbox\anonvhbox
		}{ }
}}

% NOTE: Deprecated
\newcommand{\showif}[2][false]{\draft[#1]{#2}}

% Normalized italics
\newcommand{\nem}[1]{\normalfont \em #1}

\newcommand{\tab}[1]{\hspace{.2667\textwidth}\rlap{#1}}
\newcommand{\itab}[1]{\hspace{0em}\rlap{#1}}

\newcommand*{\trim}[1]{%
	\trim@spaces@noexp{#1}%
}


%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and links
% 
% Defines the commands to set variables and sets empty defaults
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} 
\def \@name {}

\def \setCity#1{\def\@getCity{#1}} 
\def \@getCity {}

\def \setEmail#1{\def\@getEmail{\trim{#1}}}
\def \@getEmail {}

\def \setPhoneNum#1{\def\@getPhoneNum{#1}} 
\def \@getPhoneNum {}

\def \setPhoneNumberContinous#1{\def\@getPhoneNumberContinous{#1}}
\def \@getPhoneNumberContinous {}

\def \setLinkedIn#1{\def\@getLinkedIn{\trim{#1}}} 
\def \@getLinkedIn {}

\def \setLinkedInLink#1{\def\@getLinkedInLink{\trim{#1}}} 
\def \@getLinkedInLink {https://linkedin.com/in/\@getLinkedIn}

\def \setGithub#1{\def\@getGithub{\trim{#1}}}
\def \@getGithub {}

\def \setGithubLink#1{\def\@getGithubLink{\trim{#1}}} 
\def \@getGithubLink {https://github.com/\@getGithub}

\def \setStackoverflow#1{\def\@getStackoverflow{\trim{#1}}}
\def \@getStackoverflow {}

\def \setStackoverflowLink#1{\def\@getStackoverflowLink{\trim{#1}}} 
\def \@getStackoverflowLink {https://stackoverflow.com/users/\@getStackoverflow}

\def \setTwitter#1{\def\@getTwitter{\trim{#1}}}
\def \@getTwitter {}

\def \setTwitterLink#1{\def\@getTwitterLink{\trim{#1}}} 
\def \@getTwitterLink {https://twitter.com/\@getTwitter}


%\def \setWebsite#1{\def\@getWebsite{\trim{#1}}} 
%\def \@getWebsite {}
%
%\def \setWebsiteLink#1{\def\@getWebsiteLink{\trim{#1}}} 
%\def \@getWebsiteLink {https://\@getWebsite}


% NOTE: Deprecated
\def \setCustomLink#1{\def\@getWebsite{\trim{#1}}} 

\def \setPdfKeywords#1{\def\@getPdfKeywords{#1}} 
\def \@getPdfKeywords {}

\def \setPdfSubject#1{\def\@getPdfSubject{#1}} 
\def \@getPdfSubject {}

\def \linkSeparator {$\diamond$} % Set default separator to a diamond

\def \printLinks {
	\begingroup
	\def \\ {\linkSeparator\ }
	\centerline{%
		\ifthenelse{\equal{@getEmail}{}}{}{%
			\href {mailto:\@getEmail}
			{\faEnvelope \hspace{0.2mm} \@getEmail}}
		\\
		\ifthenelse{\equal{@getPhoneNum}{}}{}{%
			\href{tel:\@getPhoneNumberContinous}{
					\faPhone \hspace{0.2mm} \@getPhoneNum}
		}
		\\
		\ifthenelse{\equal{@getLinkedIn}{}}{}{%
			\href {\@getLinkedInLink}
			{\faLinkedin \hspace{0.2mm} \@getLinkedIn}}
		\\
		\ifthenelse{\equal{@getGithub}{}}{}{%
			\href {\@getGithubLink}
			{\faGithub \hspace{0.2mm} \@getGithub}}
		\ifthenelse{\equal{@getStackoverflow}{}}{}{%
			\href {\@getStackoverflowLink}
			{\faStackOverflow \hspace{0.2mm} \@getStackoverflow}}
		\ifthenelse{\equal{@getTwitter}{}}{}{%
			\href {\@getTwitterLink}
			{\faTwitter \hspace{0.2mm} \@getTwitter}}

	}
	\endgroup
	\par
	\smallskip
}

% \printname is used to print the name as a page header
\def \printname {
	\begingroup
	\hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
	\nameskip\break
	\endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
	\ori@document  % Begin document
	\hypersetup{
		pdftitle={ \@name's Resume },
		pdfauthor={ \@name <\@getEmail> },
		pdfsubject={ \@getPdfSubject },
		pdfkeywords={ \@getPdfKeywords }
	}
	\printname % Print the name specified with \name
	\printLinks
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
	\sectionskip
	\MakeUppercase{\bf #1} % Section title
	\sectionlineskip
	\hrule % Horizontal line
	\begin{list}{}{ % List for each individual item in the section
			\setlength{\leftmargin}{1.5em} % Margin within the section
		}
		\item[]
	}{
	\end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newcommand{\rSubsectionHeading}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
	\ifthenelse{\equal{#4}{} \AND \NOT \equal{#3}{}}{ % If 3 args are provided
		{\ifthenelse{\equal{#1}{}}{}{\bf #1,} {\normalfont \em #3}} \hfill {\em #2}
	}{
		\ifthenelse{\equal{#3}{}}{% If 2 args are provided
			{\bf #1} \hfill {\normalfont #2} % Bold company name and date on the right
		}{ % If 4 args are provided
			{\bf #1} \hfill {\normalfont #4} % Bold company name and location
			\\ \normalfont {\em #3} \hfill {\em #2} % Italic job title and date on the right
		}\unskip
	}
	\unskip
	\normalfont
}{}


\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
	\rSubsectionHeading{#1}{#2}{#3}{#4}
	\medskip
	\begin{list}{$\cdot$}{\leftmargin=10pt\normalfont \rightmargin=20pt} % \cdot used for bullets, no indentation
		\itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
	}{
	\end{list}
	\vspace{0.5em} % Some space after the list of bullet points
}

\newenvironment{rProjectSection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
	\rSubsectionHeading{#1}{#2}{#3}{#4}
	\medskip
	\begin{list}{$\hspace{-5pt}$}{\leftmargin=0pt\normalfont \rightmargin=20pt} % \cdot used for bullets, no indentation
		\itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
	}{
	\end{list}
	\vspace{0.5em} % Some space after the list of bullet points
}


\newenvironment{rWorkSection}[2]{ % 4 input arguments - company name, year(s) employed, job title and location
	\rSubsectionHeading{#1}{#2}{}{}
	\smallskip
	\normalfont
	}{
	\vspace{0.5em} % Some space after the list of bullet points
}

\newenvironment{rSubsectionSimple}{
	\smallskip
	\smallskip
	\begin{list}{$\cdot$}{\leftmargin=0em\normalfont} % \cdot used for bullets, no indentation
		\itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
	}{
	\end{list}
	\vspace{0.5em} % Some space after the list of bullet points
}


\newcommand{\rEducationHeading}[5]{ % 4 input arguments - company name, year(s) employed, job title and location
	\ifthenelse{\equal{#4}{} \AND \NOT \equal{#3}{}}{ % If 3 args are provided
		{\ifthenelse{\equal{#1}{}}{}{\bf #1,} {\normalfont \em #3}} \hfill {\em #2}
	}{
		\ifthenelse{\equal{#3}{}}{% If 2 args are provided
			{\bf #1} \hfill {\normalfont #2} % Bold company name and date on the right
		}{ % If 4 args are provided
			{\bf #1} \hfill {\normalfont #4} % Bold company name and location
			\\ \normalfont {\em #3} \hfill {\em #2} % Italic job title and date on the right
			\begin{addmargin}[10pt]{20pt}
				{\em #5}
			\end{addmargin}
		}\unskip
	}\unskip
}{}

\newcommand{\rEducationSubsectionHeading}[6]{ % 6 input arguments: school name, dates, degree, location, GPA, and notes
    \textbf{#1}, #4 \hfill \textit{#2} \\ % Bold school name and location, italic dates aligned to the right
    \textit{#3}, GPA: #5 % Italic degree, normal font GPA
    \ifthenelse{\equal{#6}{}}{}{ % If notes are provided
        \begin{addmargin}[10pt]{20pt} % Indented notes
            \textit{#6} % Italic notes
        \end{addmargin}
    }
}
% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\medskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section
