This global minor mode provides a simple way to switch between layouts and
the buffers you left open before you switched (unless you closed it).

It doesn't require any setup at all more than:
(0blayout-mode)

When you start emacs with 0blayout loaded, you will have a default layout
named "default", and then you can create new layouts (C-c C-l C-c), switch
layouts (C-c C-l C-b), and kill the current layout (C-c C-l C-k).

You can also customize-variable to change the name of the default session.

The project is hosted at https://github.com/etu/0blayout
There you can leave bug-reports and suggestions.

Another comparable mode is eyebrowse which have been developed for longer.
