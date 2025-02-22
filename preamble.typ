#import "@preview/ctheorems:1.1.3": *
#import "@preview/equate:0.2.1": equate
#import "@preview/commute:0.2.0": node, arr, commutative-diagram

#let preamble(
  dark-mode: false,
  doc,
) = {
  // dark mode support
  set page(fill: rgb("#32313d")) if dark-mode
  set text(fill: rgb("fdfdfd")) if dark-mode
  set line(stroke: white) if dark-mode


  // bibliography settings
  show bibliography: x => { pagebreak() + x }
  set cite(style: "alphanumeric")


  // numbering
  set heading(numbering: "1.1")

  // equation numbering
  set math.equation(
    supplement: none,
    numbering: x => {
      numbering(
        "(1.1)",
        counter(heading).get().first(),
        x,
      ) // numbering will be of the form (SECTION.EQUATION)
    },
  )
  // reset equation counter at each section
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }


  // spacing settings
  set list(indent: 1.5em)
  set enum(indent: 1.5em)

  // specify heading font and spacing
  show heading: set block(above: 1.2em, below: 1.2em)

  // square as qed symbol
  show: thmrules.with(qed-symbol: $square$)

  doc
}


#let lecture_notes(
  lecture: none,
  lecturer: none,
  lecture_id: none,
  authors: none,
  semester: none,
  date: none,
  dark-mode: false,
  doc,
) = {
  show: preamble.with(dark-mode: dark-mode)

  // geometry settings
  set page(margin: (left: 5cm, right: 5cm, top: 6cm, bottom: 7cm))
  set par(
    leading: 0.6em,
    spacing: 1.2em,
    first-line-indent: 1.5em,
    justify: true,
  )

  // make chapter titles have two lines chapter number on top
  show heading.where(level: 1): it => {
    set text(size: 16pt)
    counter(math.equation).update(0)
    if it.numbering != none {
      [Chatper #counter(heading).get().at(0) \ #block(it.body + v(1em))]
    } else {
      it
    }
  }

  // add pagebreak before new chapters unless its the first chapter or the
  // chatper is unnumbered
  show heading.where(level: 1): it => {
    if (
      it.numbering != none and counter(heading).get() != (1,)
    ) {
      pagebreak() + it
    } else {
      it
    }
  }

  set align(center)
  text(20pt, "Lecture Notes:\n" + lecture)
  v(0em)

  let lecture_info = ""
  if lecture_id != none {
    lecture_info += lecture_id + " \n"
  }
  if semester != none {
    lecture_info += "Semester: " + semester + " \n"
  }
  if lecturer != none {
    lecture_info += "Lecturer: " + lecturer + " \n"
  }
  text(14pt, lecture_info)

  v(1em)


  let show_author(author) = {
    [
      #author.name \
      #smallcaps(author.affiliation) \
      #link("mailto:" + author.email)
    ]
  }

  grid(
    columns: (1fr,) * calc.min(authors.len(), 3),
    row-gutter: 24pt,
    ..authors.map(author => show_author(author))
  )


  v(1fr)
  if date == none {
    date = datetime.today()
  }
  text(
    10pt,
    "Last Edited: "
      + date.display("[day padding:none]. [month repr:long] [year]"),
  )
  v(1em)

  // start the document
  pagebreak()
  set align(left)

  outline(
    title: [Table of Contents],
    indent: auto,
  )

  set page(margin: (left: 3.5cm, right: 3.5cm, top: 5cm, bottom: 5cm))
  set page(numbering: "1")
  counter(page).update(1)

  doc
}
