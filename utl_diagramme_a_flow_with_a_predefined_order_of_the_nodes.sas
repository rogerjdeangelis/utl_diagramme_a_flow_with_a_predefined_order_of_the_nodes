Diagramming a flow with a predefined order of the nodes

github graphics and project

example 1 graphic
https://goo.gl/rttpNA
https://github.com/rogerjdeangelis/utl_diagramme_a_flow_with_a_predefined_order_of_the_nodes/blob/master/utl_diagramme_a_flow_with_a_predefined_order_of_the_nodes_1.png

example 2 graphic
https://goo.gl/eCES3Y
https://github.com/rogerjdeangelis/utl_diagramme_a_flow_with_a_predefined_order_of_the_nodes/blob/master/utl_diagramme_a_flow_with_a_predefined_order_of_the_nodes_2.png

Two Examples (WPS Proc R)
    1. Ordering the nodes
    2. More Hierarchical example

*                               _        _
  _____  ____ _ _ __ ___  _ __ | | ___  / |
 / _ \ \/ / _` | '_ ` _ \| '_ \| |/ _ \ | |
|  __/>  < (_| | | | | | | |_) | |  __/ | |
 \___/_/\_\__,_|_| |_| |_| .__/|_|\___| |_|
                         |_|
;

I would like to specify the order of some of the nodes.

stack overflow
https://stackoverflow.com/questions/48331824/diagrammer-specifying-node-order-and-formatting-text

user20650 profile
https://stackoverflow.com/users/2250190/user20650


HAVE
====

  Note 1 is connected to 2 and 3

        ________________
       /                \
      /                 \/
   +-----+    ___       ___
   |     |   /   \     /   \
   |  1  |->|  3  |   |  2  |
   |     |   \___/     \___/
   +-----+


WANT  a cleaner representation
====
     ___      +-----+     ___
    /   \     |     |    /   \
   |  2  |<-- |  1  |-->|  3  |
    \___/     |     |    \___/
              +-----+


PROCESS (WPS/PROC R All the  code)
==================================

    %utl_submit_wps64('
    proc r;
    submit;
    source("C:/Program Files/R/R-3.3.2/etc/Rprofile.site", echo=T);
    library(DiagrammeR);
    library(DiagrammeRsvg);
    library(rsvg);
    node1<-"Node 1";
    node3<-"Node 3";
    svgout <- grViz("
          digraph CFA {
          a [label = node1, shape = rectangle, color=CornflowerBlue ];
          node [shape = ellipse, color=CornflowerBlue]
          T1    [label = node3];
          T2    [label = <Node 2 <br/> <u>extra detail</u>>];

          {rank = same; a T1 T2}
          a -> T1
          T2 -> a[dir=back]
      }");
    tmp<-capture.output(rsvg_png(charToRaw(export_svg(svgout)),"d:/png/svgout.png"));
    cat("![Need to capture browser output](svgout){#fig:svgout}\n\n");
    endsubmit;
    run;quit;
    '));

OUTPUT
======

     ___      +-----+     ___
    /   \     |     |    /   \
   |  2  |<-- |  1  |-->|  3  |
    \___/     |     |    \___/
              +-----+

*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;

  data is node definitions within the R script


 *          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;


%utl_submit_wps64('
proc r;
submit;
source("C:/Program Files/R/R-3.3.2/etc/Rprofile.site", echo=T);
library(DiagrammeR);
library(DiagrammeRsvg);
library(rsvg);
node1<-"Node 1";
node3<-"Node 3";
svgout <- grViz("
      digraph CFA {
      a [label = node1, shape = rectangle, color=CornflowerBlue ];
      node [shape = ellipse, color=CornflowerBlue]
      T1    [label = node3];
      T2    [label = <Node 2 <br/> <u>extra detail</u>>];

      {rank = same; a T1 T2}
      a -> T1
      T2 -> a[dir=back]
  }");
tmp<-capture.output(rsvg_png(charToRaw(export_svg(svgout)),
"d:/png/utl_diagramme_a_flow_with_a_predefined_order_of_the_nodes_1.png"));
cat("![Need to capture browser output](svgout){#fig:svgout}\n\n");
endsubmit;
run;quit;
'));

*                               _        ____
  _____  ____ _ _ __ ___  _ __ | | ___  |___ \
 / _ \ \/ / _` | '_ ` _ \| '_ \| |/ _ \   __) |
|  __/>  < (_| | | | | | | |_) | |  __/  / __/
 \___/_/\_\__,_|_| |_| |_| .__/|_|\___| |_____|
                         |_|
;

Example: Hierarchical: Very powerfull diagramming tool from R for UML, YAML...?

for IML-R/WPS/R output
https://www.dropbox.com/s/c6idbk356f94023/svgout.png?dl=0

see for examples
http://www.htmlwidgets.org/showcase_diagrammer.html

https://goo.gl/KiG5hM
https://www.google.com/search?q=diagrammer+graphics&rlz=1C1CHBD_enUS743US743&tbm=isch&tbo=u&source=univ&sa=X&ved=0ahUKEwjnraGIs-jVAhUj7YMKHZOUC_0QsAQITw&biw=1590&bih=857

HJ Allen profile (capture browswer output)
https://github.com/HJAllen


    WORKING CODE

        digraph {
          layout = twopi
          node [shape = circle]
          A -> {B C D}

HAVE
====

  Four nodes that I need to network

       ___      ___      ___      ___
      /   \    /   \    /   \    /   \
     |  A  |  |  B  |  |  C  |  |  D  |
      \___/    \___/    \___/    \___/

WANT
----
        ___          ___
       /   \       /   \
      |  B  |     |  C  |
       \___/       \___/
        /\          /\
         \          /
           \      /
            \___ /
            /   \
           |  A  |
            \___/
              |
              |
              |
             _V_
            /   \
           |  D  |
            \___/

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;

Data is internal to R program

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

%utlfkil(d:/png/utl_diagramme_a_flow_with_a_predefined_order_of_the_nodes_2.png); * delete if exist;

%utl_submit_wps64('
proc r;
submit;
source("c:/Program Files/R/R-3.3.2/etc/Rprofile.site",echo=T);
library(DiagrammeR);
library(DiagrammeRsvg);
library(rsvg);
svgout <- grViz("
  digraph {
    layout = twopi
    node [shape = circle]
    A -> {B C D}
  }");
tmp<-capture.output(rsvg_png(charToRaw(export_svg(svgout)),
  "d:/png/utl_diagramme_a_flow_with_a_predefined_order_of_the_nodes_2.png"));
cat("![Need to capture browser output](svgout){#fig:svgout}\n\n");
endsubmit;
');

