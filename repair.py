import os
import shutil
from pathlib import Path

#def send_proof_request():
#    # user-defined paths
#    theorems_root = Path("/home/copland/am-repos-2/my_theorem_demo/")
#    coqdog_root = Path("/home/copland/repos/CoqDog/") 

def main():
    # get CWD
    cwd = os.getcwd()

    # user-defined paths
    theorems_root = Path("/home/copland/am-repos-2/my_theorem_demo/")
    coqdog_root = Path("/home/copland/repos/CoqDog/")

    # generated paths needed for commands
    important_theorem = os.path.join(theorems_root, Path("my_theorems/ImportantTheorem.v"))
    coqdog_upload_external_folder = os.path.join(coqdog_root, Path("/uploaded_dir/external/"))
    gpt_output = os.path.join(coqdog_root, Path("gpt_output.txt"))

    # TODO: verify all generated paths exist. yes, continue; no, error and stop

    # fetch proof response
    shutil.copy(gpt_output, cwd)

    # fetch broken file
    shutil.copy(important_theorem, cwd)

    # repair process for basic CoqDog-readied file
    with open("ImportantTheorem-repaired.v", 'w') as outfile:
        with open("ImportantTheorem.v", 'r') as infile:
            for inline in infile:
                if(inline.rstrip() == "(*###Stop-Here###*)"):
                    outfile.write(inline)
                    break
                else:
                    outfile.write(inline)
        with open("gpt_output.txt") as prooffile:
            for proofline in prooffile:
                if(proofline.rstrip() == "```coq"):
                    continue
                elif(proofline.rstrip() == "```"):
                    continue
                else:
                    outfile.write(proofline)
                    
    # replace broken file
    repaired_important_theorem = os.path.join(cwd, Path("ImportantTheorem-repaired.v"))
    shutil.copy(repaired_important_theorem, important_theorem)

if __name__ == "__main__":
    main()