# H/W S/W
## Hardware
* 32 vCPU, 256GB, 3TB, per ESXi(host)

## Software License
* VMware ESXi (hypervisor) 7.0.3
* vSphere Client (vCenter) 7.0.3
* NSX-ALB (avi) 20.1.6
* Tanzu Standard - TKG 1.4.0


# NSX-ALB Configuration
## 1 - Create Account & DNS settings & NTP setting

### 1.1 Account
username
password
email

### 1.2 DNS 
DNS Resolver *2
DNS Search Domain
Long-password

### 1.3 NTP
NTP Server

## 2 - Orchestrator Intergration

### 2.1 choose VMware
vcenter login
* username
* password
* vcenter url

SDN integration:none

### 2.2 Management Network
Static
* x.x.212.0/24
* x.x.212.3-x.x.212.50
* x.x.212.1

:No

## 3 - Configurations in UI

login
  <pic>
  
### 3.1 Template > Profiles > IPAM/DNS Profiles 
  <pic>
 
#### Create IPAM Profile
  * Name: VIP
  * Add Usable Network - Default Cloud
  * Extra
  <pic>
  
### 3.2 Infrastructure > Clouds > Default Cloud
  <pic>
#### Edit Default Cloud - IPAM/DNS
    set IPAM Profile
    * IPAM Profile - VIP
    * DNS Profile- blank
    * click State Based DNS Registration
  <pic>
    
### 3.3 Templates > Security > SSL/TLS Certificates 
#### Create Controller Certification
    * Name: avi
    * Common Name: avi's hostname
    * Subject Alternate Name(SAN): avi's hostname
    * Add Subject Alternate Name(SAN): avi's IP
  <pic 2>
   點右邊 Export , copy Certificate
  <pic 1>
    <pic 3>
      
### 3.4 Administration > Settings > Access Settings > Edit
  add SSL/TLS Certificate: avi
  <pic 1>
    
    
finally done.
