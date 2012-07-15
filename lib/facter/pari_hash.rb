#
# (c) 2012 Patrick Ringl
#
# the hash is based upon fnv_32a and is mixed with knuth's multiplicative
# hashing. This ensures more fairness among the uniform distribution
#

Facter.add("pari_hash") do
  setcode do
        hash = 0x811c9dc5
	if (Facter.value('hostname') =~ /((?:q|r|l)(?:1|2))/)
		mon_env = $1 
	else
		#
		# we reliably assume that in case of failure
		# this will be noticed - if not things will go to
		# q3 - for the sake of it!
		#
		mon_env = 'q3'
	end
        Facter.value('hostname').bytes.each do |byte|
        hash = hash ^ byte
        hash = (hash * 0x01000193) % 2 ** 32
        end
        hval = (hash*2654435761) & 255;
        if (hval<85)
                ret = "#{mon_env}monbe01a"
        elsif (hval>190)
                ret = "#{mon_env}monbe01c"
        else
                ret = "#{mon_env}monbe01b"
        end
  end
end

