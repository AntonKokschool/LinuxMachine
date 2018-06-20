salt "*$1" --async cmd.run 'apt update; apt dist-upgrade -y'
