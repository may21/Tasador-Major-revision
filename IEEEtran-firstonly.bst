%% IEEEtran_firstonly.bst
%% Based on IEEEtran.bst (official IEEE style)
%% Modified to show only the first author + "et al."
%% Use only for drafts, not for final IEEE submission.

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
  }
  {}
  { label }

INTEGERS { output.state before.all mid.sentence after.block }

STRINGS  { s t }

FUNCTION {format.names}
{ 's :=
  s num.names$ 'numnames :=
  s #1 "{ff~}{vv~}{ll}{, jj}" format.name$ 'firstauthor :=
  numnames #1 >
    { firstauthor " et~al." * }
    { firstauthor }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$ label write$ "}" write$ newline$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}

FUNCTION {article}
{ output.bibitem
  format.names write$
  ", " write$
  format.title write$
  ", \emph{" journal * "}" *
  ", vol.~" volume * ", no.~" number * ", pp.~" pages * ", " year * "." *
  newline$
}

FUNCTION {book}
{ output.bibitem
  format.names write$
  ", \emph{" title * "}," *
  publisher write$
  ", " year * "." *
  newline$
}

READ
EXECUTE {article}
EXECUTE {book}
