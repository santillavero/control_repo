# PuppetMineCraft

    #### Table of Contents

    1. [Module Description - What the module does and why it is useful](#module-description)
    2. [Setup - The basics of getting started with [modulename]](#setup)
        * [What [modulename] affects](#what-[modulename]-affects)
        * [Setup requirements](#setup-requirements)
        * [Beginning with [modulename]](#beginning-with-[modulename])
    3. [Usage - Configuration options and additional functionality](#usage)
    4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    5. [Limitations - OS compatibility, etc.](#limitations)
    6. [Development - Guide for contributing to the module](#development)
    
    ## Module Description
    
    This module installs and configures a fully functional minecraft server. 
    Please note the server is an offline type server.
    
    ## Setup
    
    This section is not in use. It's just here as an example
    
    ## Usage
    
    ### Minimum-use
    
    The server comes with a number of default parameters. 
    
    ### Options available
    
    If you need to over-ride these, the use the following
    
      class {'minecraft':
        fqdn=> localhost    
        install_dir => '/opt/minecraft',
        minecraft_port => 25565,
        minecraft_seed => '',
        minecraft_world => 'Universe',
        url => 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',        
      }
       
    ## Reference
    
    ## Limitations
    
    ## Development
