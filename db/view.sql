create view vw_outlets as
	select
		ta.outletid as "outletid"
		, ta."name"  as "name"
		, ta.address as "address"
		, ta.country as "country"
		, ta.phone as "phone"
		, ta.reviews as "reviews"
		, 'tripadvisor' as "source"
	from public.ta_outlet ta
union all
	select
		ub.outletid as "outletid"
		, ub."name"  as "name"
		, ub.address as "address"
		, ub.country as "country"
		, '' as "phone"
		, ub.reviews as "reviews"
		, 'ubereats' as "source"
	from public.ub_outlet ub
	