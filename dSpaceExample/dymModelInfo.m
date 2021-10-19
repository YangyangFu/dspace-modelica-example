function mInfo = dymModelInfo

mInfo.ModelName = 'WeatherReader';
mInfo.extIncDirs = '-I"D:/github/dspace-modelica-example/Libraries/Buildings 7.0.0/Resources/C-Sources"';
mInfo.extLibDirs = '-L"C:/Program Files/Dymola 2021/Modelica/Library/Modelica 3.2.3/Resources/Library/win64"';
mInfo.libLine = ' ModelicaIO ModelicaMatIO ModelicaStandardTables zlib';

if (isunix && verLessThan('matlab', '8.4.0'))
  % Modifications needed for mex on older Linux versions
  mInfo.extIncDirs = strrep(mInfo.extIncDirs, '" -I', '"-I');
  mInfo.extIncDirs = strrep(mInfo.extIncDirs, ' ', '\\ ');
  mInfo.extIncDirs = strrep(mInfo.extIncDirs, '"-I', '" -I');
  mInfo.extLibDirs = strrep(mInfo.extLibDirs, '" -L', '"-L');
  mInfo.extLibDirs = strrep(mInfo.extLibDirs, ' ', '\\ ');
  mInfo.extLibDirs = strrep(mInfo.extLibDirs, '"-L', '" -L');
end
