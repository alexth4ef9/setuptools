# disable admin, create user0 with admin access, add public ssh key
/user
add name=user0 group=full password="##PASSWORD##";
set admin disabled=yes;
/user ssh-keys
# if the device has a folder "flash", change path to flash/<file>.pub
import user=user0 public-key-file=user0.pub;

# change router name
/system identity
set name=router0;

# wait for network interfaces
:local count 0;
:while ([/interface ethernet find] = "") do={
    :if ($count = 30) do={
        :log warning "Unable to find ethernet interfaces";
        /quit;
    }
    :delay 1s; :set count ($count +1);
};

# => insert configuration commands here

/file
remove [find name=installconfig.rsc];
# if the device has a folder "flash", change path to flash/<file>.rsc
remove example.rsc;
