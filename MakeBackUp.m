function MakeBackUp(destination,boolDisp)
    %Description: This function Used to Crete Backup from current Project
    %Usage:
    %MakeBackUp(destination,boolDisp)
    %Inputs:
    %destination:backup place on hard disk
    %boolDisp:0 for not display result and 1 for show results
    %on command window
    %under Lisence GPL by GuilanUniversity
    if nargin<2;boolDisp=1;end
    cTime=datestr(datetime('now'));
    fid=fopen([destination '\logs.txt'],'a+');
    numberOfRunes=1;
    frewind(fid);
    while ~feof(fid)
        fgetl(fid);
        numberOfRunes=numberOfRunes+1;
    end
    resultString=[ cTime ' | Run Number : ' int2str(numberOfRunes) '\r\n'];
    fprintf(fid,resultString);
    fclose(fid);
    destinationSub=[destination '\Run_Number' int2str(numberOfRunes)];
    mkdir(destinationSub)
    copyfile(pwd,destinationSub,'f');
    if boolDisp==1;disp(['back up Complete on : ' destinationSub]);end
end