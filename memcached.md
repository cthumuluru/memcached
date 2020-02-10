# Memcached
High-performance, distributed memory object caching system, generic in nature, but intended for use in speeding up dynamic web applications by alleviating database load.

## Commands
### Storage Commands

#### add
Stores the data, only if it doesn't exist already. New items are at the top of the LRU. If an item already exists and an add fails, it promotes the item to the front of the LRU anyway. 

#### set
Stores the data, possibly overwriting any existing data. New items are at the top of the LRU. 

> Flags can be used to store the metadata related to the key. For example, compression, serialization format, etc.

#### replace
Store this data, but only if the data already exists. 

#### append
Add this data after the last byte in an exising item. This doesn't allow you to extend the item past limit. Useful for managing lists. 

#### prepend
Same as append, but adding new data before existing data. 

#### cas
Check and Set. An operation that stores data, but only if no one else has updated the data since you read it last. Useful for resolving race conditions on updating cache data. 

### Retrieval Commands

#### get
Retrieves the data. Takes one of more keys and returns all found items. 

#### gets
An alternative get command for using with CAS. Returns a CAS identifier (a unique 64 bit number) with the item. Return this value with the _cas_ command. If the item's CAS value has changed since you _gets_'ed it, it will not be stored. 

#### delete
Removes an item from the cache, if it exists. 

#### incr
If an item is the string representation of a 64-bit integer, you may run incr to modify the number. You may only incr by positive values. Negative values are not accepted. If the value doesn't already exist, it fails. 

#### decr
If an item is the string representation of a 64-bit integer, you may run decr to modify the number. You may only decr by positive values. Negative values are not accepted. If the value doesn't already exist, it fails. 

### Statistics 

#### stats
Basic stats command. 

#### stats items
Returns some information broken down by slab, about items stored in memcached. 

#### stats slabs
Returns more information, broken down by slab, about items stored in memcached. More centered to performance of slab rathan than counts of particular items. 

#### flush_all
Invalidate all existing cache items. Optionally takes a parameter, which means to invalidate all items after N seconds have passed. 

It just causes all items to expire. 

## Features
### Uncommon Features

#### Get-By-Group-Key
You may choose to store data by an intermediate "key". This group key is used by the client to discover which server to store or retrieve the data. Then any keys you supply are all sent to that same server. The group key is not retained on the server, or added to the existing key in any way.
