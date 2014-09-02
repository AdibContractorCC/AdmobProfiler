iOS DFP Banner Example
======================
A simple example built on top of Google's official DFPExample project. Dynamic loading of banner ad, with the button clearing it out and reloading the ad again.

Run this in profiler to see leaks and allocations which hang around for the lifetime of the app.

**Update:** After using Admob 6.11.1, it seems this plateaus. Added a "Load 100 Ads" button which loads 1 ad per second, and the profiler shows a limit to the number of living objects during this process:

![Profile Analysis after 100 Ad loads on Admob 6.11.1](http://cl.ly/image/072B1o0O2t2J/Screen%20Shot%202014-09-02%20at%209.08.59%20AM.png "Profile Analysis after 100 Ad loads on Admob 6.11.1")

Sample profile after clicking the button a few times:
![Profile Analysis](http://cl.ly/image/0K0q0S042m2x/Screen%20Shot%202014-08-28%20at%2010.09.24%20AM.png "Profile Analysis")
