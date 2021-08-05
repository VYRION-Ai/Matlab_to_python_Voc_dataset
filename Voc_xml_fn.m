function Voc_xml_fn(name,ext,class_number,new_x,new_y,xmini,ymini,xmax,ymax,location1)
 
 formatSpec =  '%s%s';
 file_name = sprintf(formatSpec,name,ext);
 %formatSpec_xy = '%s';
 
%   new_x = sprintf(formatSpec_xy,new_x);
%   new_y= sprintf(formatSpec_xy,new_y);   
%   class_number=sprintf(formatSpec_xy,class_number); 
%   xmini=sprintf(formatSpec_xy,xmini); 
%   ymini=sprintf(formatSpec_xy,ymini); 
%   xmax=sprintf(formatSpec_xy,xmax); 
%   ymax=sprintf(formatSpec_xy,ymax); 
docNode = com.mathworks.xml.XMLUtils.createDocument('annotation');
toc = docNode.getDocumentElement;

folder = docNode.createElement('folder');
folder.appendChild(docNode.createTextNode(''));
toc.appendChild(folder);


filename= docNode.createElement('filename');
filename.appendChild(docNode.createTextNode(file_name));
toc.appendChild(filename);

path= docNode.createElement('path');
path.appendChild(docNode.createTextNode(file_name));
toc.appendChild(path);


source= docNode.createElement('source');
toc.appendChild(source);
curr_node = docNode.createElement('database');
curr_node.appendChild(docNode.createTextNode('Minstry'));
source.appendChild(curr_node);



size= docNode.createElement('size');
toc.appendChild(size);
curr_node = docNode.createElement('width');
curr_node.appendChild(docNode.createTextNode(int2str(new_x)));
size.appendChild(curr_node);
curr_node = docNode.createElement('height');
curr_node.appendChild(docNode.createTextNode(int2str(new_y)));
size.appendChild(curr_node);
curr_node = docNode.createElement('depth');
curr_node.appendChild(docNode.createTextNode('3'));
size.appendChild(curr_node);

segmented= docNode.createElement('segmented');
segmented.appendChild(docNode.createTextNode('0'));
toc.appendChild(segmented);

object= docNode.createElement('object');
toc.appendChild(object);
curr_node = docNode.createElement('name');
curr_node.appendChild(docNode.createTextNode(int2str(class_number)));
object.appendChild(curr_node);
curr_node = docNode.createElement('pose');
curr_node.appendChild(docNode.createTextNode('Unspecified'));
object.appendChild(curr_node);
curr_node = docNode.createElement('truncated');
curr_node.appendChild(docNode.createTextNode('0'));
object.appendChild(curr_node);
curr_node = docNode.createElement('difficult');
curr_node.appendChild(docNode.createTextNode('0'));
object.appendChild(curr_node);

curr_node = docNode.createElement('occluded');
curr_node.appendChild(docNode.createTextNode('0'));
object.appendChild(curr_node);

object = docNode.createElement('bndbox');
toc.appendChild(object);
curr_node = docNode.createElement('xmin');
 
curr_node.appendChild(docNode.createTextNode(int2str(xmini)));
object.appendChild(curr_node);
curr_node = docNode.createElement('ymin');

curr_node.appendChild(docNode.createTextNode(int2str(ymini)));
object.appendChild(curr_node);
curr_node = docNode.createElement('xmax');
curr_node.appendChild(docNode.createTextNode(int2str(xmax)));
object.appendChild(curr_node);
curr_node = docNode.createElement('ymax');

curr_node.appendChild(docNode.createTextNode(int2str(ymax)));
object.appendChild(curr_node);
 formatSpec =  '%s/%s.xml';
 file_name = sprintf(formatSpec,location1,name);

xmlwrite(file_name,docNode);
 


end

 
