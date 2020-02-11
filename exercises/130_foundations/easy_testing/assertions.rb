# Boolean

assert(value.odd?)

assert_equal(true, value.odd?)

# Equality

assert_equal('xyz', value.downcase)

# Nil

assert_nil(value)

# Empty Object

assert_empty(list)

assert_equal(0, list.size)

assert_equal(true, list.empty?)

# Included Object

assert_includes(list, 'xyz')

# Exceptions

assert_raises(NoExperienceError) { employee.hire }

# Type

assert_instance_of(Numeric, value)

# Kind

assert_kind_of(Numeric, value)

# Same

assert_same(list, list.process)

# Refute

refute_includes(list, 'xyz')