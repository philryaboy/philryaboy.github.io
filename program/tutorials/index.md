---
layout: default
slug: tutorials-program
---
<div class="row">
 <div class="col-md-11" markdown="1">

# Accepted Tutorials

## [T1] Taming Large Models using Hawk and NeoEMF

### Speakers: Antonio Garcia-Dominguez, Dimitris Kolovos, Konstantinos Barmpis, Gwendal Daniel and Gerson Sunyé

### Abstract
Industrial models can quickly reach a complexity
and size that makes storing them entirely in single files prohibitive.
These larger models are typically either broken up
into smaller files, or stored in a database. Using smaller files
is simpler, but running a global query can still require loading
all the files and therefore run into the same scalability issues. As
for databases, most people go directly for well-known relational
databases. However, a relational database is not the only answer
for scalability: we can use NoSQL databases to solve the issues
with queries over fragmented models, or replace relational model
stores altogether.
In this tutorial, we will discuss two approaches for achieving
scalable model persistence and querying through our Hawk
and NeoEMF open-source tools. Hawk’s approach is to use a
NoSQL database as an efficient index to the models, focusing on
improving query speed while keeping your existing persistence as
is. NeoEMF allows for persisting models in a NoSQL database,
which can speed up loading and writing of the models as well.
The presenters are the original developers of the tools, which
have seen industrial adoption through the MONDO EU FP7 and
ITEA3 MEASURE projects.

Length: half day

### Biography 

**[Antonio Garcia-Dominguez](https://www.cs.aston.ac.uk/~garcia-a/)** is Lecturer in Computer Science in the School of Engineering and Applied Science at Aston University. Antonio's current research focuses on sca able model-driven engineering, specifically high-performance querying through the development of the Hawk model indexing framework. Antonio has driven the adoption of Hawk in several European companies over the MONDO EU FP7 and ITEA3 MEASURE projects.

**[Dimitris Kolovos](https://www-users.cs.york.ac.uk/dkolovos/)** is a Professor of Software Engineering in the Department of Computer Science at the University of York, where he researches automated and model-based software engineering. He leads the open-source Epsilon model-based software engineering platform, and led the MONDO EU FP7 work package that produced the Hawk tool. Dimitris has co-authored more than 150 peer-reviewed papers and has co-organised several workshops (including BigMDE at STAF and COMMitMDE at MODELS).

**[Konstantinos Barmpis](https://www-users.cs.york.ac.uk/~kb/home.html)** is a Research Associate in the Department of Computer Science at the University of York, currently focusing on repository mining, distributed systems and domain-specific languages. He has produced the core components of the Hawk tool as part of the MONDO EU FP7 project and continues to support its development.

**[Gerson Sunyé](https://sunye.github.io)** is an Associate Professor of Software Engineering in the Department of Computer Science at the University of Nantes, where he researches software testing and model-based software engineering. He leads the Atlanmod open-source modelling platform and is the initiator of the NeoEMF tool. Gerson has co-authored more than 60 peer-reviewed papers.

**[Gwendal Daniel](https://gdaniel.github.io/)** is a post-doctoral fellow in the SOM Research Lab at Internet Interdisciplinary Institute (IN3), a research centre of the Universitat Oberta de Catalunya (UOC). His research interests include model persistence, query, and transformation techniques, as well as NoSQL data modelling. Gwendal is one of the core committers of the NeoEMF project, and the main contributor of the Mogwaï query framework.

<hr>

## [T2] Making Modeling Cool Again: Teaching and Researching Model-Driven Engineering using Animation, 3D Simulation and the Internet of Things

### Speakers: Juergen Dingel, Karim Jahed and Ernesto Posse

### Abstract
The tutorial will provide a short overview of modeldriven
software development (MDSD) with UML-RT and
Papyrus-RT. UML-RT is a proven UML profile for real-time
embedded software supported by several tools including IBM
RSA-RTE, eTrice, and Papyrus-RT, an open-source MDSD
tool. Moreover, the tutorial will show how Unity3D, a popular
development tool for three-dimensional video games, can be
used to animate the executions of code generated from models,
and to define and implement simulation scenarios that the
generated code interacts with. Finally, the tutorial will illustrate
how generated code can leveraged for the development of
Internet of Things (IoT) applications created with development
tools such as Node-RED. In each case, a key ingredient is a
suitable communication mechanism that connects the generated
code with external and separately developed software in a
suitable fashion. A central goal of the tutorial is to demonstrate
how model-driven software development (MDSD) with open
source tooling can be used in concert with software from other
technical domains and how this joint use can be mutually
beneficial by addressing problems in either MDE or the other
domain.

Length: half day

### Biography

**[Juergen Dingel](research.cs.queensu.ca/home/dingel/)** is professor in the School of Computing
at Queen’s University. He received a Ph.D. in Computer
Science in 1999 from Carnegie Mellon University. He was
PC Co-chair of the FMOODS-FORTE and MODELS con-
ferences in 2011 and 2014, respectively. He is on the editorial board of the Springer journal Software and Systems
Modeling (SoSyM), and currently serves as chair of the
MODELS Steering Committee. Juergen’s research interests include software modelling, model-driven engineering,
formal methods, and software quality assurance. He has
collaborated with a range of industrial partners on these
topics including IBM, General Motors, and Ericsson.

**[Karim Jahed]()** is PhD student in the School of Computing
at Queen’s University. He received his M.Sc. degree in
Computer Science from the Lebanese American University.
His current research focus is the model-driven development
of distributed systems for IoT applications.

**[Ernesto Posse](https://sites.google.com/site/eposse/)** is a senior software developer at Zeligsoft
(2009) Ltd. in Gatineau, Quebec, Canada, working on the
development modelling tools with focus on code generation
and mixed textual/graphical modelling. Before Zeligsoft
he was a Post-Doctoral Fellow at the School of Computing in Queen’s University (Canada). He holds Ph.D. and
M.Sc. degrees in Computer Science from McGill University
(Canada). He has long-standing research interests in the
design, implementation and semantics of programming and
modelling languages, as well as formal methods, specially
process algebras, temporal logics and model checking.

<hr>

## [T3] Develop your Own Car

### Speakers: Levi Lucio, Sebastian Voss, Tatiana Chuprina, Andreas Bayha, Johannes Eder and Sudeep Kanav

### Abstract
AUTOFOCUS3 (AF3) is a mature model-driven engineering environment to develop software for embedded systems. For the past 20 years,several versions of AF3 have served as a platform for experimenting with cutting-edge research ideas in Model-Driven Development. AF3 is a tool that fully encompasses the software life cycle, from requirements, to architecture, simulation, deployment, code generation and verification. The attendees of this tutorial will be given the unique opportunity to model and deploy software on a real remote-controlled vehicle, using only AF3. Attendees will start by modeling the software controller for a blinker, which will be integrated with the model of the vehicle’s software. The generated code will then be flashed onto a Raspberry Pi contained in the physical remote-controlled model vehicle which can then be driven in the real world. Attendees who finish early will be able to model more advanced driving assistance functionalities. The last
part of the tutorial will be dedicated to deepening the attendees’ understanding of the modeling capabilities of AF3 in areas such as requirements engineering, design-space exploration, building
safety cases, formal verification, modeling processes, testing or variability modeling.

Length: full day

### Biography

**[Levi Lúcio](https://www.fortiss.org/ueber-uns/mitarbeiter/levi-lucio/)** is a senior scientist and project manager at fortiss GmbH in Munich, Germany. He was awarded a PhD from the University of Geneva, Switzerland, in 2008, for his work on Model-Based Testing. At fortiss he works with aerospace and automotive companies to develop novel tools that include model-based software engineering and domain specificity at their core. After completing his PhD, Levi worked extensively in the area of model transformations, having proposed techniques for model transformation specification, execution and verification, as well as surveys in the domain. He has been part of the organizing committee of 10+ workshops, many of them co-located with MODELS. Levi’s current research interests are domain-specific modeling, usability in formal methods and, more recently, how machine learning can help in modeling software and in software engineering in general.

**[Sebastian Voss](https://www.fortiss.org/en/about-us/people/sebastian-voss/)** has done his PhD in the avionic context at EADS Innovation Works in the Sensors, Electronics and Systems Integration department. At fortiss he is heading the Model-based Systems Engineering department and the research group Design Space Exploration, for finding optimized system configurations. His research interests include techniques and tools for the professional development of software-intensive systems, efficient design space exploration methods
and their model-based (tool) development in A UTO FOCUS3.

**[Tatiana Chuprina]()** started at fortiss as a Master student with a study of experimental comparison between A UTO FOCUS3 and Papyrus-RT. After her successful graduation from the Frankfurt University of Applied Science in 2016, she has been developing her work as a computer scientist at the Model-based System Engineering competence field at fortiss. She is currently at the beginning of her doctoral research having as main topic requirements engineering. Before moving to fortiss, Tatiana acquired practical knowledge working for a telecommunications company as systems integrator.

**[Andreas Bayha](https://www.fortiss.org/ueber-uns/mitarbeiter/andreas-bayha/)** received his MSc in 2014 from the
Technical University Munich. Since then he works as a researcher in the model-based systems engineering division of fortiss. His research interests are methodological aspects and
tooling solutions for model-based product line engineering. In
this context he was involved in the automotive, avionics and
industrial automation domains.

**[Johannes Eder]()** received his Master of Science from
Technical University of Munich in 2015 in computer science.
Since 2015 he has worked as a research associate and PhD
candidate at fortiss. His research interests include model-based
development of embedded systems, design space exploration,
as well as their tooling support.

**[Sudeep Kanav](https://www.fortiss.org/en/about-us/people/sudeep-kanav/)** studied computer science (MSc) at the
Technical University Munich with a focus on theorem proving.
Since 2016 he is a research associate at fortiss in the "Model Based Systems Engineering" competence field. His research interests are formal verification, model based system development, and model to model transformations. He is the main developer and responsible for the formal verification feature of AutoFOCUS3.

<hr>

## [T4] DEVS Modelling and Simulation

### Speakers: Yentl Van Tendeloo and Hans Vangheluwe

### Abstract 
DEVS is a popular formalism for modelling the structure and dynamics of complex systems using a discrete-event abstraction. At this abstraction level, a timed sequence of pertinent "events" input to a system (or internal to the system, in the case of timeouts) cause instantaneous changes to the state of the system. The syntax and semantics of DEVS are precisely defined, and support modular composition. DEVS allows for performance analysis, realtime execution, and interoperation with real-world systems. DEVS may serve as a "simulation assembly language"
to which other discrete-event simulation languages such as Statecharts, Timed Automata and Cellular Automata can be mapped, preserving behaviour traces. DEVS' modular composition allows models in these different formalisms to be meaningfully coupled, after their translation to DEVS.
DEVS has also been used as a hierarchical framework for co-simulation or orchestration of discrete-event simulators. This tutorial introduces the Classic DEVS formalism in a bottom-up fashion, using a simple traffic light example. The syntax and operational semantics of Atomic
(behavioural) models are introduced first, followed by Coupled
(structural) models. Applications of DEVS are introduced by an example in performance analysis of queueing systems. The tutorial uses the tool PythonPDEVS, though this introduction is equally applicable to other DEVS tools.


Length: half day

### Biography 

**[Yentl Van Tendeloo](http://msdl.cs.mcgill.ca/people/yentl)** is a PhD student at the University of Antwerp (Belgium). He is a member of the Modelling, Simulation and Design (MSDL) research lab. In his Master’s thesis, he worked on MDSL’s PythonPDEVS simulator, a parallel and distributed simulator for Classic DEVS, Parallel DEVS, and Dynamic Structure DEVS with support for computational resource usage models. The topic of his PhD is the conceptualization and development of a new meta-modelling framework and model management system called the Modelverse.


**[Hans Vangheluwe](https://www.uantwerpen.be/en/staff/hans-vangheluwe)** is a Professor at the University of Antwerp (Belgium), and an Adjunct Professor at McGill University (Canada). He heads the Modelling, Simulation and Design (MSDL) research lab distributed over both locations. He has a long-standing interest in the DEVS formalism and has contributed fundamental and technical research results to the DEVS community. In a variety of projects, often with industrial partners, he develops and applies the model-based theory and techniques of Multi-Paradigm Modelling (MPM). His current interests are in domain-specific modelling and simulation, including the development of graphical user interfaces for multiple platforms. He is co-founder and chair of the European COST Action IC1404 "Multi-Paradigm Modelling for Cyber-Physical Systems" (MPM4CPS).

<hr>

## [T5] Developing Reactive Systems with Statecharts

### Speakers: Simon Van Mierlo and Hans Vangheluwe

### Abstract

Statecharts, introduced by David Harel in 1987, is a formalism used to specify the behaviour of timed, autonomous and reactive systems using a discrete-event abstraction. It is an extension of Timed Finite State Automata which adds depth, orthogonality, broadcast communication and history. Its visual representation is based on higraphs, which combine graphs and Venn diagrams. Many tools offer visual editing, simulation and code synthesis support for the Statecharts formalism. Examples include STATEMATE, Rhapsody, Yakindu, and Stateflow, each implementing different variants of Harel's original Semantics. This tutorial introduces Statecharts modelling, simulation, and testing. As a running example, the behaviour of a traffic light, a simple timed, autonomous and reactive system is modelled. We start from the basic concepts of states and transitions and explain the more advanced concepts of Statecharts by extending the example incrementally. We discuss several semantics variants, such as STATEMATE and Rhapsody. We use Yakindu to model the example system.

Length: half day

### Biography


**[Simon Van Mierlo](http://msdl.cs.mcgill.ca/people/simonvm/)** is a post-doctoral researcher at
the University of Antwerp (Belgium). He is a member of
the Modelling, Simulation and Design (MSDL) research lab.
For his PhD thesis, he developed debugging techniques for
modelling and simulation formalisms by explicitly modelling
their executor’s control flow using Statecharts. He is the main
developer and maintainer of SCCD [https://msdl.uantwerpen.be/documentation/SCCD/](https://msdl.uantwerpen.be/documentation/SCCD/), a hybrid formalism that combines Statecharts with Class Diagrams.

**[Hans Vangheluwe](https://www.uantwerpen.be/hans-vangheluwe)** is a Professor at the University of Antwerp (Belgium), and an Adjunct Professor at McGill University (Canada). He heads the Modelling, Simulation and Design (MSDL) research lab distributed over both locations. In a variety of projects, often with industrial partners, he develops and applies the model-based theory and techniques of Multi-Paradigm Modelling (MPM). His current interests are in domain-specific modelling and simulation, including the development of graphical user interfaces for multiple platforms. To model such reactive systems, he advocates the use of Statecharts to describe their behaviour. He is co-founder and chair of the European COST Action
IC1404 "Multi-Paradigm Modelling for Cyber-Physical Systems" (MPM4CPS).

<hr>

## [T6] Exploring Decision Space using Actor based Simulation - a Model Based Approach

### Speakers: Vinay Kulkarni, Tony Clark, Souvik Barat and Balbir Barn

### Abstract
Large complex systems such as modern enterprises typically exhibit a system of systems character. As a result, it is difficult to have an understanding of the overall system behaviour through decomposition in a top-down manner. Inherent uncertainty and fragmented information further exacerbate the task. Instead, we propose a bottom-up approach wherein the fragmented localized behaviours are captured using Actor abstraction and these micro-behaviours are simulated leading to the emergent macro-behaviour which is then analyzed using pattern-matching techniques. Ramifications of changing micro-behaviours onto the macro-behaviour can be observed using simulation thus providing an aid for exploring decision space of a large complex system. We introduce a new technology that supports decision space exploration using Actor based simulation and illustrate how it is applied to real life problems using real world case studies.

Length: half day

### Biography 
**[Tony Clark](https://www.shu.ac.uk/about-us/our-people/staff-profiles/tony-clark)** is Professor of Software Engineering at Sheffield
Hallam University in the UK. His academic research on meta-
modelling led to the development of a tool called XModeler that has
been used in a number of commercial applications including the
development of tool support for a new Enterprise Architecture
modeling language.

**[Vinay Kulkarni](https://scholar.google.co.in/citations?user=EiWmOoUAAAAJ&hl=en)** is Chief Scientist at Tata Consultancy Services
Research (TCSR). His research interests include model-driven
software engineering, self-adaptive systems, and enterprise modeling.
His work in model-driven software engineering has led to a toolset
that has been used to deliver several large business-critical systems
over the past 20 years. Much of this work has found a way into OMG
standards. Vinay also serves as Visiting Professor at Middlesex
University London.

**[Souvik Barat](https://scholar.google.com/citations?user=42udstMAAAAJ&hl=en)** is a Senior Scientist at Tata Consultancy Services
Research (TCSR). His research interests include model-driven
software engineering and enterprise modeling.

**[Balbir Barn](http://www.cs.mdx.ac.uk/people/balbir-barn/)** is Professor of Software Engineering at Middlesex
University London with extensive experience in industrial Software
Engineering including the design and implementation of the IEF.

<hr>

## [T7] Managing the Co-Evolution of Domain-Specific Languages and Models

### Speakers: Juha-Pekka Tolvanen and Steven Kelly

### Abstract
Refinement, enhancement and other maintenance tasks normally account for more work than the initial development phase. This applies to domain-specific languages and models, too. This tutorial describes practices for managing the evolution of domain-specific modelling languages, while co-evolving the models that have already been created. The presented practices are field-tested in industry cases -- some managed and refined over three decades. Participants will learn practices and patterns to form part of their toolbox for evolving their languages while in use alongside models. During the tutorial the practices learned are made concrete by applying them to sample cases.

Length: half day

### Biography

**[Juha-Pekka Tolvanen](http://users.jyu.fi/~jpt/)** is the CEO of MetaCase and co-founder of the DSM Forum. He has been involved in model-driven development and tools, notably metamodeling and code generators, since 1991. He has acted as a consultant world-wide for modeling language development, authored a book on Domain-Specific Modeling, and written over 70 articles for various software development magazines and conferences. Juha-Pekka holds a Ph.D. in computer science and he is an adjunct professor (docent on software development methods) at the University of Jyväskylä.

**[Steven Kelly](http://www.metacase.com/stevek_pubs.html)** is the CTO of MetaCase and co-founder of the DSM Forum. He has over twenty years of experience of consulting and building tools for Domain-Specific Modeling. Steven acts as an architect and lead developer of MetaEdit+, MetaCase's domain-specific modeling tool, he has seen it win or be a finalist in awards from SD Times, Byte, the Innosuomi prize for innovation awarded by the Finnish President. He is author of a book and over 50 articles. Steven has an M.A. (Hons.) in Mathematics and Computer Science from University of Cambridge, and a Ph.D. from the University of Jyväskylä.

<hr>

## [T8] ThingML: Model-Driven Software Engineering for Heterogeneous and Distributed Reactive Systems

### Speakers: Franck Fleurey, Brice Morin, Jakob Høgenes and Nicolas Ferry

### Abstract
A Cyber Physical Systems (CPS) typically relies on a
highly heterogeneous interconnection of platforms and devices
offering a diversity of complementary capabilities: from cloud
server with their virtually unlimited resources to tiny microcontrollers
supporting the connection to the physical world.
This tutorial presents a tool supported Model-Driven Software
Engineering (MDSE) approach targeting the heterogeneity and
distribution challenges associated with the development of
CPS. The approach is based on a domain specific modelling
languages called ThingML. The foundations and rational of
ThingML have been elaborated over the past years based on a
set of experiences and projects aiming applying the state of the
art in MDSE in practical contexts and with different industry
partners. The aim of the tutorial is (i) to reflect on these
experiences to motivate the approach and its implementation,
(ii) to describe the approach and its usage by the actors
involved in the development of CPS and (iii) to provide handson
experience with the associated tools.

Length: half day

### Biography

**[Franck Fleurey](http://www.fleurey.com/franck/pmwiki.php)** is a senior IoT Developer at Tellu
IoT, Asker, Norway. He received a PhD degree in Computer
Science from the University of Rennes 1 (France) in 2006. One
contribution of his thesis was the Kermeta meta-modeling
language and framework. His research interests include
model-driven software engineering, embedded systems,
product lines, adaptive systems and software validation. He
has been active in the MODELS community for more than
10 years and has had a focus on developing and using MDE
approaches in both academic and industry-driven projects.
He is the author of more than 90 peer-reviewed publications
totaling over 4700 citations.

**[Brice Morin](http://brice-morin.info/)** is a senior research scientist at SINTEF
Digital in Oslo, Norway. He holds a PhD degree in Computer
Science from the University of Rennes, France. One
contribution of his thesis was the models@runtime paradigm,
which he pioneered together with his colleagues in the EU
project DiVA. His research focuses on investigating sound
and practical modeling foundations for heterogeneous and
distributed software systems (ranging from the cloud to the
Internet of Things). He has been active in the MODELS
community for more than 10 years, including 9 accepted
papers. Since 2007, Brice published more than 60 peer-reviewed papers totaling more than 1900 citations, including
10 papers at MODELS.

**[Jakob Høgenes](https://www.sintef.no/en/all-employees/employee/?empId=5340)** is a research scientist at SINTEF
Digital in Oslo, Norway. He holds a MSc degree in
Engineering Cybernetics from the Norwegian University of
Science and Technology. His research focuses on applying
tools and methods from dynamical systems and control
theory to complex and distributed software systems, currently
addressing security in the IoT domain. Jakob will not present
at the tutorial.

**[Nicolas Ferry](https://www.sintef.no/en/all-employees/employee/?empId=4464)** is a research scientist at SINTEF Digital
(Norway). He holds a PhD degree from the University of Nice
and is interested in the application of model-driven techniques
for the design and operation of dynamically adaptive systems,
in particular applied to the IoT and Cloud Computing
domains. His main research topics includes model-driven
engineering, domain-specific languages, Internet of Things,
cloud-computing, self-adaptive systems, and dynamically
adaptive systems. He has been involved in several national and
international projects and is currently the technical manager
of the ENACT H2020 EU Project. He has been member
of program committees of several international conferences
and workshops such as the UIC conference series and the
CloudWays workshops. Nicolas will not present at the tutorial.

<hr>





## [[T9] RobMoSys: Better Models, Tools and Software for Robotic Systems](http://www.servicerobotik-ulm.de/models2018/)

### Speakers: Christian Schlegel and Herman Bruyninckx

### Abstract
The EU H2020 RobMoSys Project (http://robmosys.eu) aims to
coordinate the whole robotics community’s best and consorted
effort to realize a step change towards a European ecosystem for
open and industry-grade model-driven software development for
robotics.
This tutorial introduces the principles and model-driven
approaches for robotics envisioned in RobMoSys. It explains by
the means of an Eclipse-based tooling how the modeling
principles become accessible to different roles like component
suppliers, system builders, experts for task plots, and others and
how models are being transformed into composable software
artefacts.
A major goal of this tutorial is to give RobMoSys exposition in
the “generic” MDE community and attract more researchers
towards robotics problems. This is also about explicating the
special needs of robotics and discussing these with the MDE
community.

Length: half day

### Biography

**[Christian Schlegel](http://www.servicerobotik-ulm.de/)** is the technical Lead of the H2020 RobMoSys project. Elected coordinator of the euRobotics Topic Group on Software
Engineering, System Integration, System Engineering. Co-Founder and Associate Editor of the open access journal
JOSER – Journal of Software Engineering for Robotics. Co-Organizer of the series of International Workshop on Domain-Specific Languages and Models for Robotics Systems
(DSLRob). Head of the service robotics research group at
Hochschule Ulm, Professor for Real Time Systems and
Autonomous Systems in the Computer Science Department of
Hochschule Ulm since 2004. Co-opted member of the Faculty
of Engineering, Computer Science and Psychology of the
University of Ulm.

**[Herman Bruyninckx](https://people.mech.kuleuven.be/~bruyninc/)** is a Core Technical Partner of the H2020 RobMoSys project with a
focus on modeling of motion, perception and world model
stacks for robotics. Associate Editor of the open access journal
JOSER – Journal of Software Engineering for Robotics. From
2008 to 2015, he has been leading the robotics community in
Europe, first as Coordinator of the seminal network [EURON](http://www.euron.org/),
and in 2013-2015 as Vice-President Research of the
euRobotics association. Full professor at KU Leuven and part-time at Eindhoven University of Technology.

<hr>

## [[T10] How to Build Domain Specific Modeling Languages and Interpreters with WebGME – an Online, Collaborative Metamodeling Environment](https://webgme.readthedocs.io/en/latest/)

### Speaker: Patrik Meijer

### Abstract
WebGME (Generic Modeling Environment) is a
web-based, online, collaborative metamodeling environment
maintained by Vanderbilt University available as open source
under the MIT licence. WebGME supports the design of Domain
Specific Modeling Languages (DSML) and the creation of
corresponding domain models. The main design drivers have
been scalability, extensibility and version control. WebGME
provides a variety of extension points to customize the
application and build up Design Studios suiting particular needs.
These extensions include: plugins/interpreters, decorators,
visualizers, server routers, webhooks, layouts etc. These can be
neatly generated, shared and imported using a command line
interface, webgme-cli. After an initial introduction, the first part
of the tutorial will focus on how to define and construct a
metamodel for a specific domain using the bundled GUI running
inside a browser. As the metamodel progresses a domain model
will be built up in parallel, highlighting the way WebGME fuses
the aspects of metamodeling and modeling. In the second part, a
model interpreter for code generation will be written using an
integrated code editor inside of the WebGME GUI. In the final
part an outline of how a fully customized WebGME Design
Studio can be built up will be presented.

Length: half day

### Biography

**[Patrik Meijer](http://www.isis.vanderbilt.edu/user/277)** is a Senior Research Engineer at Vanderbilt University in Nashville, TN. He is currently one of the core developers of the WebGME framework and has taught and demonstrated WebGME at numerous occasions. He earned his MSc degree in Engineering Mathematics from Lund University, Sweden, in 2012 and has since worked for Vanderbilt University in the area of Model Integrated Computing.

**[Tamas Kecskes](http://www.isis.vanderbilt.edu/user/394)** is a Senior Research Engineer at Vanderbilt University in Nashville, TN. He took part in the architectural design of  WebGME and has been a core developer of the framework since. He earned his university diploma in 2003 from the University of Szeged, Hungary. He worked as a Software Engineer - and later as a Senior Software Engineer and Product Architect - at Nokia Ltd. for 8 years. He joined Vanderbilt University in 2012 where he started his PhD studies in 2014. He held product trainings for software engineers at Nokia and also participated in teaching courses in Model Integrated Computing at Vanderbilt.

<hr>





## [T11] Seamless Model-Based Systems Engineering: The SPES Approach

### Speakers: Andreas Vogelsang, Wolfgang Böhm, Sebastian Voss and Ilias Gerostathopoulos

### Abstract
Cyber-physical systems are based on networked
embedded software systems, which connect computational entities
in a collaborative manner with physical entities of the real world
to achieve an overall purpose for its users. Together with available
content and services from the Internet, they build networks of
collaborating systems that integrate (monitor, coordinate, control)
with the physical environment. Mastering the engineering of
complex and trustworthy CPS poses serious challenges, which
have to be addressed by the engineering methodologies of the
future. The SPES methodology is a development methodology
for cyber-physical systems, which has been developed for more
than six years by over 20 partners from academia and industry.
Meanwhile, the methodology has been adopted by several
companies in Germany. The core of the SPES methodology is a
modeling framework, which comprises the fundamental modeling
concepts that are needed, including relationships between models
such as refinement, and ways to define mappings between
modeling concepts. The SPES modeling framework categorizes
these artifacts into four viewpoints and allows specifying artifacts
on a dynamic model of layers of abstraction. This tutorial
provides an overview of the SPES modeling framework as well
as hands-on exercises and demos in the tool AutoFocus3.

Length: half day

### Biography

**[Andreas Vogelsang](https://www.dcaiti.tu-berlin.de/staff/vogelsang/)** is professor for automotive software
engineering at the Daimler Center for Automotive IT Innovations at the Technical University of Berlin. He received
his PhD from the Technical University of Munich in 2015.
His research interests comprise model-based requirements
engineering and software architectures for embedded systems.
He participated in several research collaborations with industrial partners especially from the automotive industry. He has published multiple papers at RE, MODELS, ICSE, and
REFSQ.

**[Wolfgang Böhm](www22.in.tum.de/boehm/)** is a senior research fellow at the software & systems engineering research group at the Technical
University of Munich. He holds a PhD in mathematics and
gained 25 years of professional experience in the IT and
communication industry. After joining the research group, he
led the BMBF research projects SPES2020 and SPES XT.
Model-based development is his main research interest.

**[Sebastian Voss](https://www.fortiss.org/en/about-us/people/sebastian-voss/)** has done his PhD in the avionic context
at Airbus in the Sensors, Electronics & Systems Integration department. Previously, he worked at Daimler research
& development. At fortiss, he is heading the Model-based
Systems Engineering department and the Embedded Systems
Software Engineering Institute (ESSEI). His research interests
include techniques and tools for the professional development
of collaborative software-intensive systems using model-based
methodology, efficient design space exploration methods and
their model-based tooling. He has a lectureship at the TU
Munich from the department of informatics for various lectures
incl. Modelling Distributed Systems.

**[Ilias Gerostathopoulos](http://www4.in.tum.de/~gerostat/)** is a postdoctoral researcher at the
Technical University of Munich in the Software & Systems
Engineering Research Group. He obtained a PhD in Computer
Science from the Department of Distributed and Dependable
Systems, Faculty of Mathematics and Physics, Charles University in Prague. His main research interests are software
architecture, self-adaptive systems, and big data analytics.

<hr>

## [T12] ML + FV = ♥! A Gentle Introduction to the Application of Machine Learning to Formal Verification

### Speakers: Moussa Amrani, Levi Lúcio, Adrien Bibal

### Abstract

Formal Verification (FV) and Machine Learning (ML) can seem incompatible due to their opposite mathematical foundations and their use in real-life problems: FV mostly relies on discrete mathematics and aims at ensuring correctness; ML often relies on probabilistic models and consists of learning patterns from training data. In this tutorial, we will explore how ML helps FV in some classical approaches: static analysis, theorem-proving, and SAT solving. We draw a landscape of the current practice and demonstrate with practical examples from state-of-the-art tools some of the most prominent uses of ML in FV, thus offering a new perspective on FV techniques that can help researchers and practitioners to better locate potential synergies. We will discuss lessons learned from a survey we have done during the past year, point to possible improvements and offer visions for the future of the domain in the light of the science of software and systems modelling. The tutorial will be interactive in the sense that we will hold discussions with the audience in order to both challenge the views we present throughout the tutorial and gather directions for future research on this topic.

Length: half day

### Biography

**[Moussa Amrani](https://directory.unamur.be/staff/mamrani)** is a post-doc researcher at Université
de Namur, Belgium. He graduated with a Ph.D from the
University of Luxembourg in 2013 for his work on the formal
verification of model transformation languages. In Namur, he
works with local industries to help them introduce Model-Driven Software Engineering and Domain-Specific Languages
in their development processes, and ensure the correctness of
their software through testing and formal verification tools.
He is currently involved in a Walloon Region project aiming
at certifying applications (for aeronautics DO-178C; for trains
EN 50155 and EN 5012x). Moussa’s current research interests
include software modeling, formal verification, and software
certification.

**[Levi Lúcio](https://www.fortiss.org/ueber-uns/mitarbeiter/levi-lucio/)**  is a senior scientist and project manager
at fortiss GmbH in Munich, Germany. He was awarded a
PhD from the University of Geneva, Switzerland, in 2008, for
his work on Model-Based Testing. At fortiss he works with
aerospace and automotive companies to develop novel tools
that include model-based software engineering and domain
specificity at their core. After completing his PhD, Levi
worked extensively in the area of model transformations,
having proposed techniques for model transformation specification, execution and verification, as well as surveys in
the domain. He has been part of the organizing committee
of 10+ workshops, many of them co-located with MODELS.
Levi’s current research interests are domain-specific modeling,
usability in formal methods and, more recently, how machine
learning can help in modeling software and in software engineering in general.

**[Adrien Bibal](https://directory.unamur.be/staff/abibal)** is a Ph.D. student at the Université
de Namur (Belgium) under the supervision of Professor Benoît Frénay. He received an M.S. degree in Computer Science and an M.A. degree in Philosophy from the Université catholique de Louvain (Belgium) in 2013 and 2015 respectively. His Ph.D. thesis in Machine Learning is on the
interpretability of dimensionality reduction models.
</div>
</div>

