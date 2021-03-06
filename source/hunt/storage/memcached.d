/*
 * Hunt - a framework for web and console application based on Collie using Dlang development
 *
 * Copyright (C) 2015-2017  Shanghai Putao Technology Co., Ltd
 *
 * Developer: HuntLabs
 *
 * Licensed under the Apache-2.0 License.
 *
 */

module hunt.storage.memcached;
version(USE_MEMCACHE){
public import driveMemcache = memcache;

@property Memcache()
{
	if(_memcached is null)
	{
		_memcached = new driveMemcache.Memcache();
		if(_host.length > 0)
			_memcached.addServer(_host,_port);
	}
	return  _memcached;
}

bool addMemcahedHost(string host, ushort port)
{

	return Memcache.addServer(host,port);
}

void setDefaultHost(string host, ushort port)
{
	_host = host;
	_port = port;
}

private:
driveMemcache.Memcache _memcached = null;

__gshared string _host;
__gshared ushort _port;
}
