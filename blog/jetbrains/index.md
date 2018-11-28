---
layout: default
slug: keynotes
---
<div class="row">
 <div class="col-md-11" markdown="1">


<div class="row">
<article markdown="1">

# Exclusive: Understanding JetBrains MPS with Václav Pech

#### Hi Vaclav, we are happy to have you here. Please tell us a little bit about yourself!
Hello! I’m glad that you’re interested to hear more about what we do at [JetBrains MPS](https://www.jetbrains.com/mps/){:target="_blank"}. I’m a software engineer focusing on language engineering and domain-specific languages. I’ve been involved with MPS since 2010, partly as a developer and partly as a trainer to lead educational courses on MPS.

#### So, what is JetBrains MPS?
MPS stands for Meta-Programming System and as the name suggests, it is a tool that enables meta-programming, or meta-modelling, if you will. Another term used to describe tools like MPS is Language Workbenches. With MPS, you can design languages as well as tooling for them, and then package it all as a standalone modeling tool. The tool not only allows its users to read/write code, but assists them in ways similar to how modern IDEs assist software developers:

* context-aware code-completion
* quick navigation and searches around the codebase
* integration with source code management systems
* domain-specific code analysis
* intentions
* debugging
* testing

IDEs are a domain in which JetBrains has a long and successful tradition.

Code generators can convert your DSL models into implementation code in your desired target language – Java, XML, C, JavaScript, etc. The generator bridges the semantic gap between the modeling domain and the implementation domain.

#### Why did JetBrains decide to create MPS?

JetBrains has been founded with the idea of making software development efficient. IntelliJ IDEA, our first tool, brought new concepts of efficient software development to the field of Java programming. Other IDEs then replicated that for other programming languages.

These tools go only half the way though, as they focus primarily on making software developers more efficient. MPS brings effectiveness into the domain side of software development and into cooperation between the software folks and the domain people. DSLs allow domain people to express their thoughts in a precise and unambiguous way. This alone is a huge improvement in the overall software development process.

#### How does MPS compare with other language workbenches?
All language workbenches share one core idea – software modeling can dramatically improve how software is developed. Be it thanks to tighter cooperation between the domain experts and the developers, clear separation of domain-specific models from implementation-specific code generators, or reduction of redundancy in code or lower rate of software defects, these tools are on a mission to change the software industry.

JetBrains, like some other vendors, distributes MPS under the Apache 2 open-source license, which sets very liberal rules for using the software. This encourages adoption in the industry as well as in academia and the open-source community.

Where MPS differs dramatically from other language workbenches is the projectional editor. We believe that the projectional editor is the key enabler for DSL adoption.

#### What are the main benefits of a projectional editor compared with a text editor?

There are three main ones and they all stem from the non-existence of parsing in MPS:

1. Your languages can offer rich syntaxes, such as graphical symbols, tables, or diagrams.
2. A language can have multiple notations, and the user is free to activate different notations for different tasks – coding, code review, debugging, conflict resolution, documentation, etc.
3. Languages can be thought of and used in a modular way. Extending, embedding, and combining languages becomes easy.

#### Sounds like a great technology, but who is using JetBrains MPS now?
There are quite a few exciting projects happening:
* Siemens Healthcare develops software for various medical and diagnostic systems.
* Océ Technologies models processes and systems for industrial printers.
* The tax office in the Netherlands models tax legislation with DSLs.
* Itemis is a German IT consulting company that have several projects using MPS.

Like most open-source projects, we only know about customers that actively tell us. I expect that there may be many other exciting projects out there.

#### MODELS is all about model-driven software. How is MPS related to our community?
I can see a very strong relation. MPS is all about modeling and code generation. It is a tool that enables many of the model-driven ideas to be implemented and used. Models can be tested, analyzed, interpreted, and debugged, either in an IDE or on a continuous integration server.
With intuitive domain-specific notations, high-level models can be created to capture the domain knowledge and preserve it across times, while the generators written by skilled software developers take care of generating implementation using whatever technology is popular at a given time.

#### If I decide to learn MPS, where should I start?
You can start with the ‘Fast Track to MPS’ [tutorial](https://confluence.jetbrains.com/display/MPSD20181/Fast+Track+to+MPS){:target="_blank"} to quickly get some initial knowledge. You may also consider taking part in training that JetBrains offers.
If you plan to be at the MODELS conference on Tuesday, we’re organizing an [MPS day](https://info.jetbrains.com/mps-day-models-2018-registration.html){:target="_blank"} – a half-day event filled with introductory content about MPS. Do join us!

**Thanks, Václav!**

</article>
<hr>
<h2>About Václav Pech</h2>
<img align="left" src="/assets/faces/vpech.jpg" alt="Václav Pech" class="team-face" style="margin-right: 20px;" />
<aside style="max-width: 600px ">
 Václav is passionate about programming in all its forms and flavours. He's keenly interested in server-side Java technologies, distributed and concurrent systems, modern programming languages and DSLs. He has joined JetBrains on a mission to empower developers with top-notch development tools. He's currently involved in the MPS project, developing a projectional DSL workbench and building customized DSLs.
</aside>
</div>
</div>
</div>


