local a=require("Color")local b={}b.types={textured=1,solid=2}function b.newDebugTexture(c,d,e)local f={width=c,height=d}local g=1/d;local h=1/c;local i,j=0,0;local k=false;for l=1,d do f[l]={}for m=1,c do f[l][m]=k==true and 0x0 or a.HSBToInteger(e,i,j)k=not k;j=j+g end;j=0;i=i+h;k=not k end;return f end;function b.newSolidMaterial(a)return{type=b.types.solid,color=a}end;function b.newTexturedMaterial(f)return{type=b.types.textured,texture=f}end;return b
