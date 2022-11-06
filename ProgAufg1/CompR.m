function [R] = CompR(B,D, p , k )

R= triu ( B (: , p ));
R= full ( spdiags (D ,0 , R) );

end