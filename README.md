<p align="center">
  <img src="./voucherify-ruby-sdk.png"/>
</p>

<h3 align="center">Official <a href="https://voucherify.io?utm_source=github&utm_medium=sdk&utm_campaign=acq">Voucherify</a> SDK for Ruby</h3>

<p align="center">
<a href="https://codeclimate.com/github/voucherifyio/voucherify-ruby-sdk"><img src="https://codeclimate.com/github/voucherifyio/voucherify-ruby-sdk/badges/gpa.svg" /></a>
  <a href="https://travis-ci.org/voucherifyio/voucherify-ruby-sdk"><img src="https://travis-ci.org/voucherifyio/voucherify-ruby-sdk.svg?branch=master" alt="Build Status"/></a>
  <a href="https://rubygems.org/gems/voucherify"><img src="https://img.shields.io/gem/v/voucherify.svg" alt="Gem Version"/></a>
  <a href="https://rubygems.org/gems/voucherify"><img src="https://img.shields.io/gem/dt/voucherify.svg" alt="Gem Downloads"/></a>
</p>
<hr />

<p align="center">
<b><a href="#migration-from-0-x">Migration from 0.x</a></b>
|
<b><a href="#setup">Setup</a></b>
|
<b><a href="#error-handling">Error handling</a></b>
|
<b><a href="#development">Development</a></b>
|
<b><a href="#contributing">Contributing</a></b>
|
<b><a href="#changelog">Changelog</a></b>
</p>

<p align="center">
API:
<a href="#vouchers-api">Vouchers</a>
|
<a href="#campaigns-api">Campaigns</a>
|
<a href="#distributions-api">Distributions</a>
|
<a href="#validations-api">Validations</a>
|
<a href="#redemptions-api">Redemptions</a>
|
<a href="#customers-api">Customers</a>
|
<a href="#products-api">Products</a>
|
<a href="#validation-rules-api">Validation Rules</a>
|
<a href="#segments-api">Segments</a>
|
<a href="#promotions-api">Promotions</a>
|
<a href="#events-api">Events</a>
|
<a href="#orders-api">Orders</a>
|
<a href="#loyalties-api">Loyalties</a>
|
<a href="#rewards-api">Rewards</a>
|
<a href="#utils">Utils</a>
</p>

---

## Setup

### Voucherify gem starting from 3.x requires ruby version >= 2.2

Add this line to your application's Gemfile:

```ruby
gem 'voucherify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install voucherify

[Log-in](https://app.voucherify.io/?utm_source=github&utm_medium=sdk&utm_campaign=acq#/login) to Voucherify web interface and obtain your Application Keys from [Configuration](https://app.voucherify.io/?utm_source=github&utm_medium=sdk&utm_campaign=acq#/app/configuration):

```ruby
require 'voucherify'

voucherify = Voucherify::Client.new({
  :applicationId => 'YOUR-APPLICATION-ID',
  :clientSecretKey => 'YOUR-CLIENT-SECRET-KEY'
})
```

You can also specify which API version you want to use:
```ruby
voucherify = Voucherify::Client.new({
  :applicationId => 'YOUR-APPLICATION-ID',
  :clientSecretKey => 'YOUR-CLIENT-SECRET-KEY',
  :apiVersion => 'v2017-04-05'
})
```

and timeout settings:
```ruby
voucherify = Voucherify::Client.new({
  :applicationId => 'YOUR-APPLICATION-ID',
  :clientSecretKey => 'YOUR-CLIENT-SECRET-KEY',
  :apiVersion => 'v2017-04-05',
  :timeout => 10 // in seconds
})
```

### API Endpoint

Optionally, you can add `apiUrl` to the client options if you want to use Voucherify running in a specific region.

```ruby
voucherify = Voucherify::Client.new({
  :applicationId => 'YOUR-APPLICATION-ID',
  :clientSecretKey => 'YOUR-CLIENT-SECRET-KEY',
  :apiUrl => 'https://<region>.api.voucherify.io'
})
```

## API

This SDK is fully consistent with restful API Voucherify provides.
Detailed descriptions and example responses you will find at [official docs](https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq).
Method headers point to more detailed params description you can use.

### Vouchers API
Methods are provided within `voucherify.vouchers.*` namespace.
- [Create Voucher](#create-voucher)
- [Get Voucher](#get-voucher)
- [Update Voucher](#update-voucher)
- [Delete Voucher](#delete-voucher)
- [List Vouchers](#list-vouchers)
- [Enable Voucher](#enable-voucher)
- [Disable Voucher](#disable-voucher)
- [Import Vouchers](#import-vouchers)
- [Add Gift Voucher Balance](#add-gift-voucher-balance)

#### [Create Voucher]
```ruby
voucherify.vouchers.create(code, options)
```
Check [voucher object](https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#the-voucher-object).
#### [Get Voucher]
```ruby
voucherify.vouchers.get(code)
```
#### [Update Voucher]
```ruby
voucherify.vouchers.update(voucher)
```
#### [Delete Voucher]
```ruby
voucherify.vouchers.delete(code, [params])
```
#### [List Vouchers]
```ruby
voucherify.vouchers.list
```
#### [Enable Voucher]
```ruby
voucherify.vouchers.enable(code)
```
#### [Disable Voucher]
```ruby
voucherify.vouchers.disable(code)
```
#### [Import Vouchers]
```ruby
voucherify.vouchers.import(vouchers)
```
#### [Add Gift Voucher Balance]
```ruby
voucherify.vouchers().add_balance(code, balance);
```

---

### Campaigns API
Methods are provided within `voucherify.campaigns.*` namespace.
- [Create Campaign](#create-campaign)
- [Get Campaign](#get-campaign)
- [Add Voucher to Campaign](#add-voucher-to-campaign)
- [Import Vouchers to Campaign](#import-vouchers-to-campaign)

#### [Create Campaign]
```ruby
voucherify.campaigns.create(campaign)
```
#### [Get Campaign]
```ruby
voucherify.campaigns.get(campaign_name)
```
#### [Add Voucher to Campaign]
```ruby
voucherify.campaigns.add_voucher(campaign_name, [params])
```
#### [Import Vouchers to Campaign]
```ruby
voucherify.campaigns.import_vouchers(campaign_name, vouchers)
```

---

### Distributions API
Methods are provided within `voucherify.distributions.*` namespace.

- [Publish Vouchers](#publish-vouchers)
- [Create Export](#create-export)
- [Get Export](#get-export)
- [Delete Export](#delete-export)
- [List Publications](#list-publications)
- [Create Publication](#create-publication)

#### [Publish Vouchers]
```ruby
voucherify.distributions.publish(campaign_name)
```
#### [Create Export]
```ruby
voucherify.distributions.create_export(export)
```
#### [Get Export]
```ruby
voucherify.distributions.get_export(export_id)
```
#### [Delete Export]
```ruby
voucherify.distributions.delete_export(export_id)
```
#### [List Publications]
```ruby
voucherify.distributions.list_publications(params)
```
#### [Create Publication]
```ruby
voucherify.distributions.create_publication(publication)
```
---

### Validations API
Methods are provided within `voucherify.validations.*` namespace.

- [Validate Voucher](#validate-voucher)
- [Validate Promotion Campaign](#validate-promotion-campaign)

#### [Validate Voucher]
```ruby
voucherify.validations.validate_voucher(code, [context])

# or

voucherify.validations.validate(code, [context])
```

#### [Validate Promotion Campaign]
```ruby
voucherify.validations.validate(promo_validation_context)
```

---

### Redemptions API
Methods are provided within `voucherify.redemptions.*` namespace.

- [Redeem Voucher](#redeem-voucher)
- [List Redemptions](#list-redemptions)
- [Get Voucher's Redemptions](#get-vouchers-redemptions)
- [Get Redemption](#get-redemption)
- [Rollback Redemption](#rollback-redemption)

#### [Redeem Voucher]
```ruby
# Redeem voucher code
voucherify.redemptions.redeem(code, [params])

# Redeem promotion campaign
voucherify.redemptions.redeem(promotions_tier, [params])

# Removed!
voucherify.redemptions.redeem(code, tracking_id) # use: voucherify.redemptions.redeem(code, {:customer => {:source_id => 'source_id'}})
```
#### [List Redemptions]
```ruby
voucherify.redemptions.list
voucherify.redemptions.list(params)
```
#### [Get Voucher's Redemptions]
```ruby
voucherify.redemptions.get_for_voucher(code)
```
#### [Get Redemption]
```ruby
voucherify.redemptions.get(redemption_id);
```
#### [Rollback Redemption]
```ruby
voucherify.redemptions.rollback(redemption_id, [params])

# Removed!
voucherify.redemptions.rollback(code, tracking_id, reason) # use: voucherify.redemptions.rollback(code, {:customer => {:source_id => 'source_id'}, :reason => 'reason'})
```
Check [redemption rollback object](https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#the-redemption-rollback-object).

---

### Promotions API
Methods are provided within `voucherify.promotions.*` namespace.

- [Create Promotion Campaign](#create-promotion-campaign)
- [Validate Promotion Campaign](#validate-promotion-campaign)
- [List Promotion's Tiers](#list-promotions-tiers)
- [Create Promotion's Tier](#create-promotions-tier)
- [Redeem Promotion's Tier](#redeem-promotions-tier)
- [Update Promotion's Tier](#update-promotions-tier)
- [Delete Promotion's Tier](#delete-promotions-tier)

Check [promotion campaign object](https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-promotion-campaign).
#### [Create Promotion Campaign]
```ruby
voucherify.promotions.create(promotion_campaign)
```
#### [Validate Promotion Campaign]
```ruby
voucherify.promotions.validate(validation_context)
```
#### [List Promotion's Tiers]
```ruby
voucherify.promotions.tiers.list(promotion_campaign_id)
```
Check [promotion's tier object](https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#the-promotion-object)
#### [Create Promotion's Tier]
```ruby
voucherify.promotions.tiers.create(promotion_id, promotions_tier)
```
#### [Redeem Promotion's Tier]
```ruby
voucherify.promotions.tiers.redeem(promotions_tier_id, redemption_context)
```
#### [Update Promotion's Tier]
```ruby
voucherify.promotions.tiers.update(promotions_tier)
```
#### [Delete Promotion's Tier]
```ruby
voucherify.promotions.tiers.delete(promotions_tier_id)
```

---

### Customers API
Methods are provided within `voucherify.customers.*` namespace.

- [List Customers](#list-customers)
- [Create Customer](#create-customer)
- [Get Customer](#get-customer)
- [Update Customer](#update-customer)
- [Delete Customer](#delete-customer)

#### [List Customers]
```ruby
voucherify.customers.list(options)
```
Check [options](https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-customers).

#### [Create Customer]
```ruby
voucherify.customers.create(customer)
```
Check [customer object](https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#the-customer-object).
#### [Get Customer]
```ruby
voucherify.customers.get(customer_id)
```
#### [Update Customer]
```ruby
voucherify.customers.update(customer)
```
#### [Delete Customer]
```ruby
voucherify.customers.delete(customer_id)
```

### Products API
Methods are provided within `voucherify.products.*` namespace.

- [Create Product](#create-product)
- [Get Product](#get-product)
- [Update Product](#update-product)
- [Delete Product](#delete-product)
- [List Products](#list-products)
- [Create SKU](#create-sku)
- [Get SKU](#get-sku)
- [Update SKU](#update-sku)
- [Delete SKU](#delete-sku)
- [List all product SKUs](#list-all-product-skus)

#### [Create Product]
```ruby
voucherify.products.create(product)
```
Check [product object](https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#the-product-object).
#### [Get Product]
```ruby
voucherify.products.get(product_id)
```
#### [Update Product]
```ruby
voucherify.products.update(product)
```
#### [Delete Product]
```ruby
voucherify.products.delete(product_id)
```
#### [List Products]
```ruby
voucherify.products.list([params])
```
#### [Create SKU]
```ruby
voucherify.products.create_sku(product_id, sku)
```
Check [SKU object](https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#the-sku-object).
#### [Get SKU]
```ruby
voucherify.products.get_sku(product_id, sku_id)
```
#### [Update SKU]
```ruby
voucherify.products.update_sku(product_id, sku)
```
#### [Delete SKU]
```ruby
voucherify.products.delete_sku(product_id, sku_id)
```
#### [List all product SKUs]
```ruby
voucherify.products.list_skus(product_id)
```

---

### Validation Rules API
Methods are provided within `voucherify.validation_rules.*` namespace.

- [Create Validation Rules](#create-validation-rules)
- [Get Validation Rules](#get-validation-rules)
- [List Validation Rules](#list-validation-rules)
- [Update Validation Rules](#update-validation-rules)
- [Delete Validation Rules](#delete-validation-rules)

- [Create Validation Rule Assignment](#create-validation-rule-assignment)
- [List Validation Rule Assignments](#list-validation-rule-assignments)
- [Delete Validation Rule Assignment](#delete-validation-rule-assignment)

#### [Create Validation Rules]
```ruby
voucherify.validation_rules.create(rules);
```
#### [Get Validation Rules]
```ruby
voucherify.validation_rules.get(id);
```
#### [List Validation Rules]
```ruby
voucherify.validation_rules.list(query);
```
#### [Update Validation Rules]
```ruby
voucherify.validation_rules.update(rules);
```
#### [Delete Validation Rules]
```ruby
voucherify.validation_rules.delete(id);
```

#### [Create Validation Rule Assignment]
```ruby
voucherify.validation_rules.assignments.create(rule_id, assignment);
```
#### [List Validation Rule Assignments]
```ruby
voucherify.validation_rules.assignments.list(rule_id, query);
```
#### [Delete Validation Rule Assignment]
```ruby
voucherify.validation_rules.assignments.delete(rule_id, assignment_id);
```
---

### Segments API
Methods are provided within `voucherify.segments.*` namespace.

- [Create Segment](#create-segment)
- [Get Segment](#get-segment)
- [Delete Validation Rules](#delete-segment)

#### [Create Segment]
```ruby
voucherify.segments.create(segment);
```
#### [Get Segment]
```ruby
voucherify.segments.get(id);
```
#### [Delete Segment]
```ruby
voucherify.segments.delete(id);
```

---

### Orders API

#### [Create Order]
```ruby
voucherify.orders.create(order);
```
#### [Get Order]
```ruby
voucherify.orders.get(id);
```
#### [Update Order]
```ruby
voucherify.orders.update(id, order);
```
#### [List orders]
```ruby
voucherify.orders.list(params);
```

---

### Rewards API

#### [Create Rewards]
```ruby
voucherify.rewards.create(reward);
```
#### [Get Reward]
```ruby
voucherify.rewards.get(id);
```
#### [Update Reward]
```ruby
voucherify.rewards.update(id, reward);
```
#### [List Rewards]
```ruby
voucherify.rewards.list(params);
```
#### [Delete Reward]
```ruby
voucherify.rewards.delete(id);
```

#### [List Reward Assignments]
```ruby
voucherify.rewards.assignments.list(reward_id, query);
```
#### [Create Reward Assignment]
```ruby
voucherify.rewards.assignments.create(reward_id, assignment);
```
#### [Update Reward Assignment]
```ruby
voucherify.rewards.assignments.update(reward_id, assignment_id, assignment);
```
#### [Delete Reward Assignment]
```ruby
voucherify.rewards.assignments.delete(reward_id, assignment_id);
```
---

### Loyalties API

#### [List Loyalties]
```ruby
voucherify.loyalties.list(query);
```
#### [Create Loyalty]
```ruby
voucherify.loyalties.create(loyalty);
```
#### [Get Loyalty]
```ruby
voucherify.loyalties.get(id);
```
#### [Update Loyalty]
```ruby
voucherify.loyalties.update(id, loyalty);
```
#### [Delete Loyalty]
```ruby
voucherify.loyalties.delete(id);
```

#### [List Loyalty Reward Assignments]
```ruby
voucherify.loyalties.assignments.list(loyalty_id, query);
```
#### [Create Loyalty Reward Assignment]
```ruby
voucherify.loyalties.assignments.create(loyalty_id, assignment);
```
#### [Update Loyalty Reward Assignment]
```ruby
voucherify.loyalties.assignments.update(loyalty_id, assignment_id, assignment);
```
#### [Delete Loyalty Reward Assignment]
```ruby
voucherify.loyalties.assignments.delete(loyalty_id, assignment_id);
```

#### [List Loyalty Earning Rules]
```ruby
voucherify.loyalties.earning_rules.list(loyalty_id, query);
```
#### [Create Loyalty Earning Rule]
```ruby
voucherify.loyalties.earning_rules.create(loyalty_id, earning_rule);
```
#### [Update Loyalty Earning Rule]
```ruby
voucherify.loyalties.earning_rules.update(loyalty_id, earning_rule_id, earning_rule);
```
#### [Delete Loyalty Earning Rule]
```ruby
voucherify.loyalties.earning_rules.delete(loyalty_id, earning_rule_id);
```

#### [List Loyalty Members]
```ruby
voucherify.loyalties.members.list(loyalty_id, query);
```
#### [Add Loyalty Member]
```ruby
voucherify.loyalties.members.add(loyalty_id, member);
```
#### [Get Loyalty Member]
```ruby
voucherify.loyalties.members.get(loyalty_id, member_id);
```
#### [Add Loyalty Card Balance]
```ruby
voucherify.loyalties.members.add_balance(loyalty_id, member_id, add_balance);
```
#### [Redeem Loyalty Reward]
```ruby
voucherify.loyalties.members.redeem_reward(loyalty_id, member_id, redeem_reward);
```
---

### Events API
Methods are provided within `voucherify.events.*` namespace.

- [Events](#events)

#### [Create event]
```ruby
voucherify.events.track(event, metadata, customer, referral);
```

```ruby
voucherify.events.track_event(data);
```

### Async Actions API
Methods are provided within `voucherify.async_actions.*` namespace.
- [Get Async Action](#get-async-action)
- [List Async Actions](#list-async-actions)

#### [Get Async Action]
```java
voucherify.async_actions.get(id);
```

#### [List Async Actions]
```java
voucherify.async_actions.list(query);
```

---

### Migration from 0.x

Version 1.x of the SDK is not backwards compatible with versions 0.x.
Changes made in version 1.x mostly relate to grouping methods within namespaces.
So all you need to do is to follow the list bellow and just replace methods
with their namespaced equivalent.

- `Voucherify.new(params)` - `Voucherify::Client.new(params)`
- `voucherify.create(voucher)` - [voucherify.vouchers.create](#create-voucher)
- `voucherify.get(voucher_code)` - [voucherify.vouchers.get](#get-voucher)
- `voucherify.update(voucher)` - [voucherify.vouchers.update](#update-voucher)
- `voucherify.list(params)` - [voucherify.vouchers.list](#list-vouchers)
- `voucherify.enable(voucher_code)` - [voucherify.vouchers.enable](#enable-voucher)
- `voucherify.disable(voucher_code)` - [voucherify.vouchers.disable](#disable-voucher)
- `voucherify.publish(campaign_name)` - [voucherify.distributions.publish](#publish-vouchers)
- `voucherify.validate(voucher_code, params)` - [voucherify.validations.validate](#validate-voucher)
- `voucherify.redeem(voucher_code, tracking_id)` - [voucherify.redemptions.redeem](#redeem-voucher)
- `voucherify.redemption(voucher_code)` - [voucherify.redemptions.get_for_voucher](#get-vouchers-redemptions)
- `voucherify.redemptions(params)` - [voucherify.redemptions.list](#list-redemptions)
- `voucherify.rollback(redemption_id, tracking_id, reason)` - [voucherify.redemptions.rollback](#rollback-redemptions)
- `voucherify.create_customer(customer)` - [voucherify.customers.create](#create-customer)
- `voucherify.get_customer(customer_id)` - [voucherify.customers.get](#get-customer)
- `voucherify.update_customer(customer)` - [voucherify.customers.update](#update-customer)
- `voucherify.delete_customer(customer_id)` - [voucherify.customers.delete](#delete-customer)
- `Utils.round_money(value)` - `Voucherify::Utils.round_money(value)`
- `Utils.validate_percent_discount(discount)` - `Voucherify::Utils.validate_percent_discount(discount)`
- `Utils.validate_amount_discount(discount)` - `Voucherify::Utils.validate_amount_discount(discount)`
- `Utils.validate_unit_discount(discount)` - `Voucherify::Utils.validate_unit_discount(discount)`
- `Utils.calculate_price(base_price, voucher, [unit_price])` - `Voucherify::Utils.calculate_price(base_price, voucher, [unit_price])`
- `Utils.calculate_discount(base_price, voucher, [unit_price])` - `Voucherify::Utils.calculate_discount(base_price, voucher, [unit_price])`

---

### Utils

#### Available methods

- `Voucherify::Utils.round_money(value)`
- `Voucherify::Utils.validate_percent_discount(discount)`
- `Voucherify::Utils.validate_amount_discount(discount)`
- `Voucherify::Utils.validate_unit_discount(discount)`
- `Voucherify::Utils.calculate_price(base_price, voucher, [unit_price])`
- `Voucherify::Utils.calculate_discount(base_price, voucher, [unit_price])`

---

## Error handling

When the Voucherify API responds with an error (HTTP status code is 4xx or 5xx) then the client raises a `VoucherifyError`.
It contains following properties:
- `code` - HTTP status code
- `message` - a human-readable message providing short description about the error.
- `details` - a human-readable message providing more details about the error, usually includes a hint on how to fix the error
- `key` - a short string describing the kind of error that occurred.

Example:

```ruby
begin
  voucherify.distributions.publish('test')
rescue Voucherify::VoucherifyError => e
  puts e.code
  puts e.message
  puts e.details
  puts e.key
end
```

The ouput may be:

```
400
Couldn't find any voucher suitable for publication.
Use auto-update campaigns if you want Voucherify to generate vouchers automatically.
no_voucher_suitable_for_publication
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rspective/voucherify-ruby-sdk.

## Changelog
- **2021-06-14** - `4.0.0` - Bumped required ruby version, bumped dependencies, added `Consents` API support, remove deprecated `URI.escape`.
- **2020-03-09** - `3.0.0` - Bumped required ruby version, bumped dependencies, added `list` method in Customers module.
- **2019-06-19** - `2.4.0` - Added support for custom API endpoint, that allows to connect to projects created in specific Voucherify region.
- **2019-05-09** - `2.3.0` - Added `create_publication` method in Distributions module.
- **2019-04-23** - `2.2.0` - Loyalties API, Rewards API, Orders API.
- **2019-02-19** - `2.1.1` - Treat `referral` as optional in custom events. Added new method for custom event tracking.
- **2019-02-19** - `2.1.0` - Handle `referral` in custom events tracking.
- **2018-12-27** - `2.0.0` - Business validation rules.
- **2018-09-05** - `1.6.1` - Request timeout settings
- **2017-11-16** - `1.6.0` - Expose promotion API, Redemptions and Validations namespace update
- **2017-11-16** - `1.5.0` - Expose events API
- **2017-05-07** - `1.4.0` - Segments, Validation rules, API Versioning
- **2017-03-22** - `1.3.0` - improved error handling
- **2017-01-04** - `1.2.0` - added [import vouchers](#import-vouchers) method.
- **2016-12-29** - `1.1.0` - introduced [campaigns api](#campaigns-api) and [products api](#products-api).
- **2016-12-15** - `1.0.0` - introduced namespaces, unified method names, updated README. Migration from versions 0.x required [migration from version 0.x](#migration-from-0x)
- **2016-12-02** - `0.8.2` - support gift vouchers in utils, fix price and discount calculations for amount discounts
- **2016-10-03** - `0.8.1` - publish update
- **2016-08-02** - `0.8.0` - validate voucher
- **2016-07-18** - `0.7.0` - voucher udpate
- **2016-07-05** - `0.6.0` - new utils module
- **2016-06-16** - `0.5.0` - unified naming convention
- **2016-06-12** - `0.4.0` - new customer sdk methods
- **2016-05-24** - `0.3.0` - new publish structure
- **2016-04-27** - `0.2.0` - rollback redemption
- **2016-04-13** - `0.1.3` - bugfix in redeem()
- **2016-04-13** - `0.1.2` - removed dependency to `pry`
- **2016-04-12** - `0.1.1` - minor gemspec changes
- **2016-04-12** - `0.1.0` - First version:
  - Authentication
  - Voucher information: *retrieve voucher*, *list vouchers*, *retrieve redemptions*, *list redemptions*
  - Voucher operations: *redeem voucher*, *publish voucher*, *create voucher*, *enable/disable voucher*


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

[Get Async Action]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#get-async-actions-1
[List Async Actions]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-async-actions

[Create Voucher]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-voucher
[Get Voucher]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#vouchers-get
[Update Voucher]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#update-voucher
[Delete Voucher]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#delete-voucher
[List Vouchers]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-vouchers
[Enable Voucher]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#enable-voucher
[Disable Voucher]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#disable-voucher
[Import Vouchers]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#import-vouchers-1
[Add Gift Voucher Balance]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#add-gift-voucher-balance

[Create Campaign]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-campaign
[Get Campaign]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#get-campaign
[Add Voucher to Campaign]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#add-voucher-to-campaign
[Import Vouchers to Campaign]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#import-vouchers

[Publish Vouchers]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-publication
[Create Export]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-export
[Get Export]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#get-export
[Delete Export]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#delete-export
[List Publications]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-publications
[Create Publication]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-publication

[Validate Voucher]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#validate-voucher

[Redeem Voucher]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#redeem-voucher
[List Redemptions]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-redemptions
[Get Voucher's Redemptions]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#vouchers-redemptions
[Get Redemption]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#get-redemption
[Rollback Redemption]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#rollback-redemption

[Create Promotion Campaign]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-promotion-campaign
[Validate Promotion Campaign]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#validate-promotions-1
[List Promotion's Tiers]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#get-promotions
[Create Promotion's Tier]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#add-promotion-tier-to-campaign
[Redeem Promotion's Tier]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#redeem-promotion
[Update Promotion's Tier]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#update-promotion
[Delete Promotion's Tier]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#delete-promotion

[Create Customer]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-customer
[Get Customer]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#read-customer
[Update Customer]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#update-customer
[Delete Customer]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#delete-customer

[Create Product]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-product
[Get Product]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#get-product
[Update Product]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#update-product
[Delete Product]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#delete-product
[List Products]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-products
[Create SKU]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-sku
[Get SKU]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#get-sku
[Update SKU]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#update-sku
[Delete SKU]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#delete-sku
[List all product SKUs]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-skus

[Create Validation Rules]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-validation-rules
[Get Validation Rules]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#get-validation-rules
[List Validation Rules]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-validation-rules
[Update Validation Rules]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#update-validation-rules
[Delete Validation Rules]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#delete-validation-rules
[Create Validation Rule Assignment]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-validation-rules-assignment
[Delete Validation Rule Assignment]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#delete-validation-rules-assignment
[List Validation Rule Assignments]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-validation-rule-assignments

[Create Segment]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-segment
[Get Segment]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#get-segment
[Delete Segment]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#delete-segment

[Events]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#the-custom-event-object
[Create event]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-custom-event

[Create Order]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-order
[Get Order]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#get-order
[Update Order]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#update-order
[List orders]: https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-orders

[Create Rewards]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-reward
[Get Reward]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#get-reward
[Update Reward]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#update-reward
[List Rewards]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-rewards
[Delete Reward]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#delete-reward
[List Reward Assignments]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-reward-assignments
[Create Reward Assignment]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-reward-assgnment
[Update Reward Assignment]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#update-reward-assignment
[Delete Reward Assignment]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#delete-reward-assignment

[List Loyalties]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-loyalty-programs
[Create Loyalty]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-loyalty-program
[Get Loyalty]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#get-loyalty-program
[Update Loyalty]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#update-loyalty-program
[Delete Loyalty]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#delete-loyalty-program

[List Loyalty Reward Assignments]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-reward-assignments-1
[Create Loyalty Reward Assignment]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-reward-assignment-1
[Update Loyalty Reward Assignment]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#update-reward-assignment-1
[Delete Loyalty Reward Assignment]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#delete-reward-assignment-1

[List Loyalty Earning Rules]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-earning-rules
[Create Loyalty Earning Rule]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-earning-rule
[Update Loyalty Earning Rule]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#update-earning-rule
[Delete Loyalty Earning Rule]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#delete-earning-rule

[List Loyalty Members]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#list-members
[Add Loyalty Member]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#create-member
[Get Loyalty Member]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#get-member
[Add Loyalty Card Balance]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#add-loyalty-card-balance
[Redeem Loyalty Reward]:https://docs.voucherify.io/reference?utm_source=github&utm_medium=sdk&utm_campaign=acq#redeem-loyalty-card
