Hop
===

Description
-----------

Hop is a command line bookmark opener.

Hop means jump in Danish and that's what Hop will do for you. It'll jump to
wherever you want to go. It's a tool to utilize the OS X open command combined
with a database of aliases.

Examples
--------

    $ hop -a google:http://google.com
    $ hop google

And you default browser will open http://google.com for you.

Or you could just do

    $ hop g

But wait, there's more!

    $ hop -a notes:~/Desktop/notes.txt
    $ hop notes

And Hop will open the notes.txt file on your desktop.

But wait, there's more!

    $ hop oo

And Hop will search your aliases for any matching oo, in this case google
and, yes you guessed it, open google in your browser.

And now you think, what about conflicts? If there's more than one match Hop
will list all possibles with a number in front:

    $ hop e

    0: google
    1: notes

Now you can pick the one you want with:

    hop e 0

And Hop will... well, you get the point.

And that's all there is to it. Enjoy!

Installation
------------

    gem install hop

Or something to that effect. Requires Ruby and Rubygems.

Inspiration
-----------

Hop was inspired by these awesome projects:

* [autojump](https://github.com/joelthelion/autojump)
* [Quicksilver](http://www.blacktree.com/)
* [Alfred](http://www.alfredapp.com/)