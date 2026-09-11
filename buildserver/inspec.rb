# Inspec for Linux buildserver

title 'Ensure Zulu Java 11 is installed'    

    describe command('java --version') do
        its('stdout') { should match /openjdk 11/ }
        its('exit_status') { should eq 0 }
    end 

title 'Ensure Ansible 2.9.14 is installed'

    describe command('ansible --version') do
        its('stdout') { should match /2.9.14/ }
        its('exit_status') { should eq 0 }
    end

title 'Ensure Packer 1.6.4 is installed'

    describe command('packer --version') do
        its('stdout') { should match '1.6.4' }
        its('exit_status') { should eq 0 }
    end   
    
title 'Ensure Node 12.19.1 is installed'

    describe command('node --version') do
        its('stdout') { should match '12.19.1' }
        its('exit_status') { should eq 0 }
    end    

title 'Ensure Maven 3.5.2 is installed'

    describe command('mvn --version') do
        its('stdout') { should match /3.5.2/ }
        its('exit_status') { should eq 0 }
    end   

title 'Ensure Docker is installed'

    describe package('docker') do
        it { should be_installed }
    end    

title 'Ensure Font Config is installed'    

    describe package('fontconfig') do
        it { should be_installed }
    end    

title 'Ensure Python 3 is installed'    

describe command('python3 -V') do
    its('stdout') { should match /Python 3/ }
    its('exit_status') { should eq 0 }
end 
    
title 'Ensure Git is installed'    

    describe package('git') do
        it { should be_installed }
    end 
    
title 'Ensure Dot Net SDK 2.2 is installed'    

    describe package('dotnet-sdk-2.2-2.2.402-1.x86_64') do
        it { should be_installed }
    end 

title 'Ensure Dot Net SDK 3.1 is installed'    

    describe package('dotnet-sdk-3.1-3.1.403-1.x86_64') do
        it { should be_installed }
    end 

title 'Ensure Dot Net SDK 5.0.400 is installed'    

    describe package('dotnet-sdk-5.0-5.0.400-1.x86_64') do
        it { should be_installed }
    end     
    
title 'Ensure Powershell is installed'    

    describe package('powershell') do
        it { should be_installed }
    end 
    
title 'Ensure gulp-cli is installed'    

    describe command('gulp -v') do
        its('exit_status') { should eq 0 }
    end  
    
title 'Ensure Karma is installed'    

    describe command('karma --version') do
        its('exit_status') { should eq 0 }
    end 
    
title 'Ensure Azure Devop Agent file exist'

    describe file('/opt/agent/run.sh') do
        it { should exist }
    end 
    
title 'Ensure Ruby is installed'    

    describe package('ruby') do
        it { should be_installed }
    end 
    
title 'Ensure Inspec is installed'    

    describe package('inspec') do
        it { should be_installed }
    end 

title 'Ensure Kerberos is installed'    

    describe package('krb5-devel-1.15.1-37.amzn2.2.2.x86_64') do
        it { should be_installed }
    end 

title 'Ensure pywinrm is installed'

    describe command('pip list') do
        its('stdout') { should match /pywinrm/ }
        its('exit_status') { should eq 0 }
    end
    