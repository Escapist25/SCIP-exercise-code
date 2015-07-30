#class con():
	#def __init__(self):
		#self.a = 0
		#self.b = 0
	#def set_element(self,a,b):
		#self.a = a
		#self.b = b
	#def get_res(self):
		#return self.a+self.b
#
#A = con()
#A.set_element(5,4)
#print A.get_res()
def is_p(n):
	if n < 2:
		return 0
	if n == 2:
		return 1
	if not (n & 1):
		return 0
	i = 3
	while i*i <= n:
		if n % i == 0:
			return 0
		i += 2
	return 1
print sum(filter(is_p,range(1,101)))
