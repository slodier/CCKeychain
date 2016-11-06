# CCKeychain
<h2>iOS 10以下都可以真机、模拟器测试，iOS 10及以上只能真机测试</h2>
<h2>解决办法是: 选择capabilities 打开 keychain Groups</h2>
</hr>
<b>How to use?<b>
```Objective-c
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:field.text forKey:KEY_PASSWORD];
    [CCKeychain save:KEY_USERNAME_PASSWORD data:usernamepasswordKVPairs];
```
