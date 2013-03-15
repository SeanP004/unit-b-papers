%%%%%
% Class for type setting responses to reviewers
% Author: Thai Son Hoang
%%%%%
%%%%% 
% Change log:
%
% 12/04/2012: Initial version
%%%%%
%%%%% BEGIN Identification part %%%%
\NeedsTeXFormat{LaTeX2e}\relax
\ProvidesClass{response}[2012/04/12]
%%%%% END Identification part %%%%%

%%%%% BEGIN Declaration of options %%%%%
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%%%%% END Declaration of options %%%%%

%%%%% BEGIN Execution of options %%%%%
\ProcessOptions\relax
%%%%% END Execution of options %%%%%

%%%%% BEGIN Special class file commands %%%%%
\LoadClass{article}
\PassOptionsToClass{10pt}{article}
%%%%% END Special class file commands %%%%%

%%%%% BEGIN Package loading %%%%%
\RequirePackage{url}
\RequirePackage{a4wide}
%%%%% END Package loading %%%%%

%%%%% BEGIN Fields with some default value %%%%%
\newcommand{\title@response}{Paper title}
\newcommand{\papertitle}[1]{\renewcommand{\title@response}{#1}}
\newcommand{\author@response}{Paper author}
\newcommand{\paperauthor}[1]{\renewcommand{\author@response}{#1}}
\newcommand{\acknowledgement@response}{%
  We are in debt to the anonymous reviewers for their constructive
  comments of the paper. We have updated our paper accordingly and
  addressed the reviewers' concerns. Below are the summary of our
  updates with regards to the reviewers' comments.%
}
\newcommand{\acknowledgement}[1]{\renewcommand{\acknowledgement@response}{#1}}
%%%%% END Fields with some default value %%%%%

%%%%% BEGIN Title %%%%%

%%%%% Redefine \maketitle
\renewcommand{\maketitle}
{
  \begin{center}
    {\LARGE \textsf{Responses to Reviewers' Comments}}
    
    \bigskip
    
    for paper titled
    
    \emph{\title@response}
    
    by
  
    \textsf{\author@response}
  \end{center}

  \bigskip

  \paragraph{Thanks}
  \acknowledgement@response
}

%%%%% Always start with title
\AtBeginDocument{
  \pagestyle{empty}
  \maketitle
}

%%%%% END title %%%%%

%%%%% BEGIN Special environments %%%%%
\newenvironment{comment}[1]{
  \bigskip
  \textbf{Reviewer \#{#1}:}
}{}

\newenvironment{response}{
  \medskip
  \textit{Response:}
}
{}
%%%%% END Special environments %%%%%

%%%%% BEGIN Special commands %%%%%

%%%%% END Special commands %%%%%
