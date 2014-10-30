docker-boinc-gpu
================

A container with all the necessary to BOINC GPU projects via CUDA within Docker.

### Usage:

One a host with the CUDA drivers and devices present.

	sudo docker run \
	  --device=/dev/nvidia0:/dev/nvidia0 \
	  --device=/dev/nvidiactl:/dev/nvidiactl \
	  --device=/dev/nvidia-uvm:/dev/nvidia-uvm \
	  -v /home/ec2-user/docker-boinc/data:/data \
	  -it \
	  --rm \
	  ozzyjohnson/boinc-gpu

### Next:

- Script/instructions to configure the a host machine with CUDA.
