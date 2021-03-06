import { makeArtifactNameBody } from "../../util/util";
import sanitize from "sanitize-filename";

export async function makeArtifactNames(): Promise<void> {
	const body = makeArtifactNameBody("Break_the_Barrier");
	const names = {
		client: body + "-client",
		server: body + "-server",
		lang: body + "-lang",
	};

	Object.keys(names).forEach((name) => {
		console.log(`::set-output name=${name}::${sanitize(names[name].toLowerCase())}`);
	});
}