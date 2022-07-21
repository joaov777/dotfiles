FROM archlinux


# instaling base packages
RUN pacman -Sy && pacman -S git net-tools iputils vi vim sudo --noconfirm --needed

# create users
RUN useradd -m -s /bin/bash -k /etc/skel joao
RUN useradd -m -s /bin/bash -k /etc/skel victor

# enabling permissions 
RUN echo -e "joao ALL=(ALL:ALL) ALL\nvictor ALL=(ALL:ALL) ALL\n%wheel ALL=(ALL:ALL) ALL\n%sudo ALL=(ALL:ALL) ALL" >> /etc/sudoers

# changing users passwords
RUN echo joao:joao | chpasswd
RUN echo victor:victor | chpasswd