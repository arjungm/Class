a=get(h,'Children');

%loop through all the children of the contourgroup object
for k=1:length(a)

%only consider the children that are patch objects
%STRCMP compares two strings and return true if they are the same
if strcmp(get(a(k),'Type'),'patch')

%'UserData' indicates the elevation associated with a patch
switch get(a(k),'UserData')
case 1
set(a(k),'EdgeColor','g');
%set the 'EdgeColor' for the line at elevation 0.4 to blue
case -1
set(a(k),'EdgeColor','r');
%set the 'EdgeColor' for the line at elevation -0.4 to red
case 0
set(a(k),'EdgeColor','b');
        
end
end
end