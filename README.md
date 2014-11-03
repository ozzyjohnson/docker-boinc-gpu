docker-boinc-gpu
================

Builds a container with all the necessary bits to run BOINC GPU projects via CUDA within Docker.

### Usage:

One a host with the CUDA drivers and devices present. If you don't have one, the scripts over [here](https://github.com/ozzyjohnson/ec2-gpu) should help.

	sudo docker run \
	  --device=/dev/nvidia0:/dev/nvidia0 \
	  --device=/dev/nvidiactl:/dev/nvidiactl \
	  --device=/dev/nvidia-uvm:/dev/nvidia-uvm \
	  -v /home/ec2-user/docker-boinc/data:/data \
	  -it \
	  --rm \
	  ozzyjohnson/boinc-gpu --attach_project <project_url> <weak_key>

Launch a ```g2.2xlarge``` with Amazon Linux (```ami-b66ed3de```), run the script.

### Next:

- Script/instructions to configure the a host machine with CUDA.
- Ready-made AMI.
