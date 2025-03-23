import three;
import nurbsToBezier;

/* Reference:
   @article{Qin97,
   title={{Representing quadric surfaces using NURBS surfaces}},
   author={Qin, K.},
   journal={Journal of Computer Science and Technology},
   volume={12},
   number={3},
   pages={210--216},
   year={1997},
   publisher={Springer}
   }
*/

size(10cm);
currentprojection=orthographic(5,4,2);

// udegree=2, vdegree=3, nu=3, nv=4;

real[] W={2/3,1/3,1};
real[] w={1,1/3,1/3,1};

// 10 distinct control points
triple[][] P={{(0,0,1),(-2,-2,1),(-2,-2,-1),(0,0,-1)},
              {(0,0,1),(2,-2,1),(2,-2,-1),(0,0,-1)},
              {(0,0,1),(2,2,1),(2,2,-1),(0,0,-1)},
              {(0,0,1),(-2,2,1),(-2,2,-1),(0,0,-1)}};

P.cyclic=true;

for(triple[] p: P)
  dot(p,heavygreen);

real[][] weights=new real[3][4];
for(int i=0; i < 3; ++i)
  for(int j=0; j < 4; ++j)
    weights[i][j]=W[i]*w[j];

real[] uknot={0,0,1/3,1/2,1,1};
real[] vknot={0,0,0,0,1,1,1,1};


for(int i=0; i < 4; ++i) {
  triple[][] Q=P[i:i+3];
  if(prc())
    draw(Q,uknot,vknot,weights,blue);
  else {
    NURBSsurface surface2=NURBSsurface(Q,uknot,vknot,weights);
    surface2.draw(blue+opacity(0.5));
  }
}

//draw(xscale3(-1)*octant1,red);
//draw(xscale3(-1)*zscale3(-1)*octant1,red);
