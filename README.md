composter
=========

![A pile of compost.](http://compostcab.com/wp-content/uploads/2012/11/sprout.png)

A trashy C compiler for fun and profit. This'll mostly be done over the summer, this repo is just up to help me organize my thoughts about it.

Status: pre-processing stage. See [compp](https://github.com/cosmicexplorer/compp) for details.

## Which languages will it support?

C, duh. It's a cool language and nontrivial to implement, without requiring wizard magic (looking at you, C++11). Everyone's done a lisp interpreter at this point.

## Which language will it be written in?

I'm thinking coffeescript, I'm really feeling that right now. I want to use a high-level language (something with fucking garbage collection, at least). I would consider using a lisp or scheme, but I'm worried that such a solution would be very much a lisp program, and the approaches it requires you to take would not really portable to other languages (any use of macros, for example). Since I envision this being somewhat of an educational project (details below), I would prefer that it be written in a commonly used language, with relatable idioms. I'd use python or ruby, but python is stupid and I don't know ruby that well.

## What will it compile to?

Linux 64-bit ELF binaries. Probably other targets later, but I'll consider this project complete when it can compile pretty much everything I throw at it (I'd love to have it compile Linux, gcc, and glibc for test purposes, but that may end up being too much of a hassle).

## Why?

Because I think compilers are cool? I think a lot of the complexity of writing a compiler is bootstrapped away at this point, with parser generators or the LLVM project providing pluggable implementations of pretty much every phase of compilation. That's totally boring! Don't get me wrong, I love that technology has advanced so that practical compilers can be written with a minimum of hassle, but I want to really get into the nuts and bolts; I plan to write this without resorting to any external tools.

In tandem, though, I plan to document the design thoroughly, and aim for clarity and correctness over speed. The point of this project is not to make a compiler people will actually use; it's to make a compiler I can use to learn more about what compilers do (which will hopefully give me skills I can then turn to working on actual compilers like gcc or clang).

Finally, I don't like the idea of some bright CS student taking a compilers course and not writing a compiler for a "real" language. COOL is actually quite an interesting project on its own, but (in my opinion) it doesn't necessarily translate directly into experience students can use to work on actual compilers for actual languages (which I feel should be the goal of any compilers course). The use of a high-level language to write it will hopefully increase readability, and coupled with documentation (in code comments and external documents), I can see composter making C a more practical language to teach and give as a final project in a compilers course.

But really, I just wanna write a compiler. I don't care if anybody else looks at it.

## How?

Well, writing it in a high-level language (aka not C itself) is likely going to make the speed of development (and my level of sanity) much more tolerable in general than attempting to make another gcc. In addition, I don't plan to focus on many optimizations, which are typically a very large portion of modern compiler design, and yet utterly uninteresting to me right now (in their own right, they're very cool, but the compiler as a whole interests me more than the ivory tower that is compiler optimizations). I've detailed above that I don't plan to resort to parser-generator tools, because however painful it might be, I really think the project won't be done until I can say I designed the whole thing from scratch. That will exacerbate the process, but I think it will be fun. There may even be multiple implementations of a specific feature if I end up liking it a lot.

That being said, I probably haven't convinced you that this is actually going to happen. That's fine -- no hard feelings. Just make sure to star this repo when I finish it up.

## Goals

1. To produce a C compiler which can compile the below program:
  ```c
  #include <stdio.h>

  int main(int argc, char ** argv){
    printf("hello world!\n");
  }
  ```
  (and hopefully many more).

2. To document the experience and provide a structured method for others to follow in my footsteps. This may come as a series of blog posts, or it may be held in a single change-log. Hopefully that daily log along with the other documentation produced will elucidate what design decisions were made, and why the compiler ended up in exactly this way, and hopefully serve as a guide for other students making the same plunge.

3. To have fun!

--Danny McClanahan
