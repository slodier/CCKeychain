# CCKeychain
<h2>iOS 10以下都可以真机、模拟器测试，iOS 10及以上只能真机测试</h2>
<h2>解决办法是: 选择capabilities 打开 keychain Groups</h2>
</hr>
<b>How to use?<b>
<h3>Save</h3>
```Objective-c
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:field.text forKey:KEY_PASSWORD];
    [CCKeychain save:KEY_USERNAME_PASSWORD data:usernamepasswordKVPairs];
```
<h3>Read</h3>
```Objective-c
    NSMutableDictionary *usernamepasswordKVPairs = (NSMutableDictionary *)[CCKeychain load:KEY_USERNAME_PASSWORD];
    NSLog(@"%@",[usernamepasswordKVPairs objectForKey:KEY_PASSWORD]);
```
<h3>Delete</h3>
```Objective-c
        [CCKeychain delete:KEY_USERNAME_PASSWORD];
```
