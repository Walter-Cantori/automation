squared_array = (1..4).map { |i| i*i }      #=&gt; [1, 4, 9, 16]
p squared_array

collect_array = (1..4).collect { "cat"  }
p collect_array

#collect_concat and flat_map are two names for the same method.
flat_map_arry = [1, 2, 3, 4].flat_map { |e| [e, -e] } #=&gt; [1, -1, 2, -2, 3, -3, 4, -4]
p flat_map_arry

flat_map_arry1 = [[1, 2], [3, 4]].flat_map { |e| e  } #=&gt; [1, 2, 100, 3, 4, 100]
p flat_map_arry1

p [1,2,3,4,5,6,7,8,9,10].find_all { |i|  i % 3 == 0 }   #=&gt; [3, 6, 9]

p [1,2,3,4,5].select { |num|  num.even?  }   #=&gt; [2, 4]

p (1..10).find_index  { |i| i % 5 == 0 and i % 7 == 0 }  #=&gt; nil
p (1..100).find_index { |i| i % 5 == 0 and i % 7 == 0 }  #=&gt; 34
p (1..100).find_index(50)                               #=&gt; 49
p (1..100).grep 38..44   #=&gt; [38, 39, 40, 41, 42, 43, 44]
p %w(abc def ghi jkl mno pqr).grep 'abc'


p (1..10).select { |i|  i % 3 == 0 }   #=&gt; [3, 6, 9]
p [1,2,3,4,5].find_all { |num|  num.even?  }   #=&gt; [2, 4]'


p (1..10).reject { |i|  i % 3 == 0 }   #=&gt; [1, 2, 4, 5, 7, 8, 10]
p [1, 2, 3, 4, 5].reject { |num| num.even? } #=&gt; [1, 3, 5]
