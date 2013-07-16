require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  test "save store success" do
    store = Store.new(title: 'title', permalink: 'test-store', description: '', subdomain: 'test-domain')
    assert store.save!
  end

  test "save store with blank attr" do
    store = Store.new(title: '', permalink: '', description: '', subdomain: '')
    store.save

    assert store.errors.keys.include?(:title)
    assert_equal store.errors[:title], ["can't be blank"]
    assert store.errors.keys.include?(:permalink)
    assert_equal store.errors[:permalink], ["can't be blank"]
    assert store.errors.keys.include?(:subdomain)
    assert_equal store.errors[:subdomain], ["can't be blank", "Only letters and '-' allowed", "is too short (minimum is 3 characters)"]
  end

  test "save store with duplicate subdomain" do
    store = Store.new(title: 'aa', permalink: 'aa', description: '', subdomain: 'one-store')
    store.save

    assert store.errors.keys.include?(:subdomain)
    assert_equal store.errors[:subdomain], ["has already been taken"]
  end

  test "save with subdomain format" do
    store1 = Store.new(title: 'aa', permalink: 'aa', description: '', subdomain: 'a-b')
    assert store1.save!

    store2 = Store.new(title: 'bb', permalink: 'bb', description: '', subdomain: 'abc')
    assert store2.save!

    store3 = Store.new(title: 'cc', permalink: 'cc', description: '', subdomain: '999')
    assert store3.save!


    store4 = Store.new(title: 'bbb', permalink: 'bbb', description: '', subdomain: '---')
    assert store4.save!

    store5 = Store.new(title: 'ddd', permalink: 'dd', description: '', subdomain: '400-999-000')
    assert store5.save!

    store6 = Store.new(title: 'ddd', permalink: 'dd', description: '', subdomain: '400-999-AGH')
    assert store6.save!

  end

  test "save subdomain with error format" do
    store = Store.new(title: 'aa', permalink: 'aa', description: '', subdomain: 'a%b')
    assert_equal store.save, false
    assert_equal store.errors[:subdomain], ["Only letters and '-' allowed"]
  end

  test "save subdomain with length" do
    store = Store.new(title: 'aa', permalink: 'aa', description: '', subdomain: 'abc')
    assert store.save!
  end

  test "save subdomain with length error" do
    store1 = Store.new(title: 'aa', permalink: 'aa', description: '', subdomain: 'ab')
    assert_equal store1.save, false
    assert_equal store1.errors[:subdomain], ["is too short (minimum is 3 characters)"]

    store2 = Store.new(title: 'aa', permalink: 'aa', description: '', subdomain: 'a'*21)
    assert_equal store2.save, false
    assert_equal store2.errors[:subdomain], ["is too long (maximum is 20 characters)"]
  end
end
