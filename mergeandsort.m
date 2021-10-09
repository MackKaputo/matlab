function f=mergeandsort(z,nonpit)
z=[z(:,1:4) z(:,6)];
nonpit=[nonpit nonpit(:,4)];
f=[z;nonpit];
f=sortrows(f,[1 2 3]);