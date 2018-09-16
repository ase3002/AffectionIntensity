# fix_weka_output.py
# python fix_weka_output.py <data_type> <original_test_data> <weka_predictions> <output file>
# data_type: 1 for regression (EI and V), 2 for ordinal classification (EI and V)

import sys

def fix_reg_output(original_target,weka_output,output_file):
    """
    Fixes the output of weka predictions for regressions tasks
    """
    
    
    org=open(original_target, "r",encoding="latin-1")
    header=org.readline()
    org.close()    
    
    f=open(weka_output, "r",encoding="latin-1")
    lines=f.readlines()
    f.close()
    
    out=open(output_file,"w",encoding="latin-1")
    out.write(header)
    for line in lines[1:len(lines)]:
        parts=line.split("\t")
        if len(parts)==7:
            out.write(parts[4]+'\t'+parts[5][1:len(parts[5])-1]+'\t'+parts[6].strip()+'\t'+parts[2]+'\n')
    out.close()
            

def fix_oc_output(original_target,weka_output,output_file):
    """
    Fixes the output of weka predictions for ordinal classification tasks
    """
    
    org=open(original_target, "r",encoding="latin-1")
    org_lines=org.readlines()
    org.close()    
    
    # creates a dictionary with the original label names
    label_names=dict()
    for org_line in org_lines[1:len(org_lines)]:
        label_map=org_line.split("\t")[3].split(":")
        if not label_map[0] in label_names:
            label_names[label_map[0]]=label_map[1]
        
    
    
    f=open(weka_output, "r",encoding="latin-1")
    lines=f.readlines()
    f.close()
    
    out=open(output_file,"w",encoding="latin-1")
    out.write(org_lines[0])
    for line in lines[1:len(lines)]:
        parts=line.split("\t")
        if len(parts)==8:
            predicted_class=parts[2].split(":")[1]
            out.write(parts[5]+'\t'+parts[6][1:len(parts[6])-1]+'\t'+parts[7].strip()+'\t'+predicted_class+':'+label_names[predicted_class])
    out.close()
    
   
    
def main(argv):
    print (argv)  
    
    if len(argv)!=4:
        raise ValueError('Invalid number of parameters.')
    
    data_type=int(argv[0])
    original_target=argv[1]
    weka_output=argv[2]
    output_file=argv[3]
    
    if(data_type==1):    
        fix_reg_output(original_target,weka_output,output_file)
    elif(data_type==2):
        fix_oc_output(original_target,weka_output,output_file)
   
        
if __name__ == "__main__":
    main(sys.argv[1:])
