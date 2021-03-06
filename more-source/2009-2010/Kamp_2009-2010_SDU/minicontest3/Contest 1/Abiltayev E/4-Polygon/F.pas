const eps=10E-7 ;
type tlar=array[0..106] of record a,b,c: real; end;
var a:array[0..106] of record x,y:real; end;  sum:longint;
b:tlar;
n,i,j,k:integer;
l,r,d,u:real; ll,rr,dd,uu: integer;

function eqreal(a,b:real):boolean;
begin
        if abs(a-b)<=eps then eqreal:=true else eqreal:=false;
end;

procedure calc(var b:tlar); var i:integer;
begin
for i:=1 to n-1 do
begin
        b[i].a:=a[i+1].y-a[i].y;
        b[i].b:=-(a[i+1].x-a[i].x);
        b[i].c:=-(b[i].a*a[i].x-b[i].b*a[i].y);
end;
b[n].a:=a[1].y-a[n].y; b[n].b:=-(a[1].x-a[n].x);
b[n].c:=-(b[n].a*a[n].x-b[n].b*a[n].y)
end;

function point(i,j:integer):boolean; var k:integer;
begin
        point:=true;
        for k:=1 to n-1 do
begin
        if eqreal(b[k].a*i + b[k].b*j + b[k].c, 0) then exit;
        if eqreal(b[k+1].a*i + b[k+1].b*j + b[k+1].c, 0) then exit;
        if (b[k].a*i + b[k].b*j + b[k].c)>0 then
        if (b[k+1].a*i + b[k+1].b*j + b[k+1].c)<0 then
        begin point:=false; exit; end;
        if (b[k].a*i + b[k].b*j + b[k].c)<0 then
        if (b[k+1].a*i + b[k+1].b*j + b[k+1].c)>0 then
        begin point:=false; exit; end;
end;
        if eqreal(b[n].a*i + b[n].b*j + b[n].c, 0) then exit;
        if eqreal(b[1].a*i + b[1].b*j + b[1].c, 0) then exit;
        if (b[n].a*i + b[n].b*j + b[n].c)>0 then
        if (b[1].a*i + b[1].b*j + b[1].c)<0 then
        begin point:=false; exit; end;
        if (b[n].a*i + b[n].b*j + b[n].c)<0 then
        if (b[1].a*i + b[1].b*j + b[1].c)>0 then
        begin point:=false; exit; end;
end;

begin
assign(input,'F.in');reset(input);
assign(output,'F.out');rewrite(output);
readln(n);  d:=10000; u:=-10000; l:=10000; r:=-10000;

for i:=1 to n do
begin  readln(a[i].x,a[i].y);
if a[i].x<l then l:=a[i].x;
if a[i].x>r then r:=a[i].x;
if a[i].y>u then u:=a[i].y;
if a[i].y<d then d:=a[i].y ;      end;

ll:=trunc(l); rr:=trunc(r); uu:=trunc(u); dd:=trunc(d);
sum:=0;  if n<3 then begin write('0'); halt; end;
calc(b);
for i:=dd to uu do
for j:=ll to rr do
begin
if point(j,i) then inc(sum);
end;

write(sum); close(input); close(output); end.


