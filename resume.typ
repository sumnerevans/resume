#import "@preview/use-tabler-icons:0.15.0": *

#let today = datetime.today()

#set page(
  paper: "us-letter",
  margin: 0.5in,
  footer: context {
    set align(center)
    [
      _Last updated #datetime.display(today, "[day padding:none] [month repr:long] [year]")_
    ]
  },
)
#set text(font: "Iosevka", size: 10pt)

#let heading-row-font-size = 10.5pt

#show heading.where(level: 1): it => [
  #set text(weight: 700, size: 20pt)
  #pad(it.body)
]

#show heading.where(level: 2): it => [
  #pad(top: 0em, bottom: 0.25em, it.body)
]

#grid(
  columns: (1fr, auto),
  gutter: 1em,
  align: bottom,
  [
    = Jonathan Sumner Evans
    #box(baseline: 11%, ti-mail()) resume\@sumnerevans.com
    | #box(baseline: 6%, ti-brand-matrix()) \@sumner:nevarro.space
    | #ti-map-pin() Denver, CO
  ],
  stack(
    spacing: 0.4em,
    [
      #link("https://sumnerevans.com")[
        #box(baseline: 14%, ti-world())
        sumnerevans.com
      ]
    ],
    [
      #link("https://github.com/sumnerevans")[
        #box(baseline: 3%, ti-brand-linkedin())
        linkedin.com/in/sumnerevans
      ]
    ],
    [
      #link("https://github.com/sumnerevans")[
        #box(baseline: 8%, ti-brand-github())
        github.com/sumnerevans
      ]
    ],
  ),
)

#line(length: 100%)

#let showdate(date) = {
  if (date == datetime.today()) {
    "Present"
  } else {
    datetime.display(date, "[month repr:long] [year]")
  }
}

// Generic one by two component for resume
#let generic-one-by-two(
  left: "",
  right: "",
) = {
  pad(
    bottom: -0.15em,
    [
      #left #h(1fr) #right
    ],
  )
}

#let work-experience(title, company, location, start, end) = {
  set text(size: heading-row-font-size)
  generic-one-by-two(
    left: [ *#title* --- #company --- #location ],
    right: [ _#showdate(start) - #showdate(end)_ ],
  )
}

#let education(school, degree, location, start, end) = {
  set text(size: heading-row-font-size)
  generic-one-by-two(
    left: [ *#school* --- #degree --- #location ],
    right: [ _#showdate(start) - #showdate(end)_ ],
  )
}

#let presentation(title, place, date) = {
  set text(size: heading-row-font-size)
  generic-one-by-two(
    left: [ *#title* --- #place ],
    right: [ _#showdate(date)_ ],
  )
}

== #box(baseline: 3%, ti-briefcase-filled()) WORK EXPERIENCE

#work-experience(
  "Senior Implementation Tech Lead",
  "Can/Am Technologies",
  "Highlands Ranch, CO",
  datetime(year: 2025, month: 04, day: 01),
  datetime.today(),
)

- Managing and mentoring the team of developers responsible for building
  integrations with third-party vendors for Teller, a revenue centralisation
  platform for municipal governments.
- Collaborating with business analysts and project managers to improve
  requirements gathering and technical feasibility assessment processes across
  the Implementations team.
- Leading multiple efforts to make integration architecture more declarative
  and configuration-driven.

#work-experience(
  "Software Engineer",
  "Beeper",
  "Remote",
  datetime(year: 2021, month: 07, day: 01),
  datetime(year: 2025, month: 04, day: 01),
)

- Scaled our backend infrastructure from handling \<1,000 users to >100,000
  users by *sharding* traffic from high-volume bridges to a separate *Go*
  service called
  #link("https://github.com/sumnerevans/hungryserv-presentation")[_Hungryserv_]
  in a backwards-compatible, transparent manner. I created the initial proof of
  concept and then continued as a core member of the 3-member team that
  productionized the project over a four-month period.
- Reduced RAM usage for the
  #link("https://github.com/mautrix/telegramgo")[*Telegram*] to *Matrix* bridge
  by \~2TB (80%) by rewriting from Python to *Go*.
- *Reverse-engineered* and implemented features for
  #link(
    "https://blog.beeper.com/p/introducing-beeper-mini-get-blue",
  )[_Beeper Mini_]
  (iMessage on Android) including media, tapbacks, typing indicators, read
  receipts, edits, unsends, link previews, and chat metadata changes.
- Implemented the cryptographic key infrastructure necessary for message key
  backups and interactive device verification in
  #link("https://github.com/mautrix/go")[mautrix-go] by utilizing the standard
  Go *cryptography libraries*.
- Implemented media upload/download and interactive device verification in the
  Beeper client SDK written in *Go* which is being used in the next generation
  Beeper clients.
- Measured message send *latency and reliability* by instrumenting bridge
  *metrics*. Built a Dockerized *Go* service to process those metrics and send
  them to BigQuery.
- *Reverse-engineered* the LinkedIn Messaging API and implemented a
  #link("https://github.com/beeper/linkedin")[LinkedIn] to Matrix bridge in
  *Python*.
- Designed a framework for importing users' chat history, and implemented it in
  the
  #link("https://github.com/mautrix/whatsapp")[WhatsApp],
  #link("https://github.com/mautrix/facebook")[Facebook],
  #link("https://github.com/mautrix/instagram")[Instagram], and
  #link("https://github.com/mautrix/telegramgo")[Telegram] bridges.

#work-experience(
  "Adjunct Professor",
  "Colorado School of Mines",
  "Golden, CO",
  datetime(year: 2018, month: 08, day: 01),
  datetime(year: 2024, month: 12, day: 01),
)

- *Algorithms* 4$times$ --- advanced data structures, graph algorithms, dynamic
  programming, NP-completeness
- *Programming Languages* (4$times$) --- functional programming, parsers, type
  systems, formal semantics
- *Computer Organization* (1$times$) --- RISC-V assembly, pipelining, processor
  design, memory hierarchy
- *Computer Architecture* (1$times$) --- cache coherence, virtual memory,
  branch prediction, multiprocessors

#work-experience(
  "Software Engineer",
  "The Trade Desk",
  "Denver, CO",
  datetime(year: 2019, month: 06, day: 01),
  datetime(year: 2021, month: 07, day: 01),
)
#work-experience(
  "Software Developer Intern",
  "Can/Am Technologies",
  "Lakewood, CO",
  datetime(year: 2013, month: 02, day: 01),
  datetime(year: 2016, month: 08, day: 01),
)

== #box(baseline: 5%, ti-book()) EDUCATION

#education(
  "Colorado School of Mines",
  "B.S. + M.S. in Computer Science",
  "Golden, CO",
  datetime(year: 2016, month: 07, day: 01),
  datetime(year: 2019, month: 05, day: 01),
)

- Outstanding Graduating Senior for Computer Science
- Chair of Mines ACM, Service Chair of Tau Beta Pi, *Linux* Help Guru of Mines
  Linux Users Group (LUG)

== #box(baseline: 3%, ti-presentation()) TALKS & PRESENTATIONS

#presentation(
  "Matrix Cryptographic Key Infrastructure",
  "Matrix Conference",
  datetime(year: 2024, month: 09, day: 01),
)

- Provided an overview of how key sharing, key backup, device and user
  verification, and secret storage operate within Matrix to provide
  cryptographically secure messaging features.

#presentation(
  "Hungryserv: A Homeserver Optimized for Unfederated Use-Cases",
  "Berlin Matrix Summit",
  datetime(year: 2022, month: 08, day: 01),
)

- Discussed a Matrix-compatible homeserver that Beeper uses to handle
  unfederated bridge traffic.
