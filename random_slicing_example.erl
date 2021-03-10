ToDegree = fun({List, _}) ->
	lists:map(fun({I, N}) -> {360 * hash:as_unit(I) - 90, N} end, List) end,
W0 = [{n0, 100}, {n1, 100}, {n2, 100}, {n3, 100}],
W1 = [{n0, 100}, {n1, 100}, {n2, 100}, {n3, 100}, {n4, 100}],
W2 = [{n0, 100}, {n1, 100}, {n2, 100}, {n3, 100}, {n4, 100}, {n5, 100}, {n6, 100}],
W3 = [{n0, 100}, {n1, 100}, {n2, 100}, {n3, 100}, {n4, 100}, {n5, 100}, {n6, 100}, {n7, 100}, {n8, 100}, {n9, 100}],
C0 = chash:fresh(W0),
C1 = chash:change(C0, W1),
C2 = chash:change(C1, W2),
C3 = chash:change(C2, W3),
{PrefList, _} = replication:replicate(hash:as_integer(0.345), C3),
{lists:map(ToDegree, [C0, C1, C2, C3]),
lists:map(fun({I, N}) -> {hash:as_unit(I), N} end, PrefList)}.