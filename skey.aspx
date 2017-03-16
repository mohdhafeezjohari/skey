using System;
using System.Security.Cryptography;
using System.Text;

public class Program
{
	public static void Main()
	{
		string amount = "12.99";
		string orderid = "DG873";
		string tranID = "178017";
		string domain = "test7858";
		string status = "00";
		string appcode = "1489575390922";
		string error_code = "";
		string skey = "80ae57ff5b53d8001279379e932f1d1d";
		string currency = "RM";
		string channel = "credit";
		string paydate = "2017-03-15 18:27:14";
		string vkey = "a186b74e5bc93f83c8f778ef1a3c21e1";
		
		string key0 = getMd5Hash(string.Concat(tranID, orderid, status, domain, amount, currency));
		string key1 = getMd5Hash(string.Concat(paydate, domain, key0, appcode, vkey));
		
		Console.WriteLine(key1);
		Console.WriteLine(skey);
	}
	
	static string getMd5Hash(string input)
	{
		MD5 md5Hasher = MD5.Create();
		byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
		StringBuilder sBuilder = new StringBuilder();
	
		for (int i = 0; i < data.Length; i++)
		{
			sBuilder.Append(data[i].ToString("x2"));
		}
	
		return sBuilder.ToString();
	}
}
